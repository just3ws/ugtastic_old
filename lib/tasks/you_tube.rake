require 'dotenv/tasks'
require 'google/api_client'

namespace :you_tube do
  namespace :import do
    namespace :channel do
      desc 'Imports YouTube videos for channel'
      task videos: %i(dotenv environment) do
        client = Google::APIClient.new(
          key: ENV['GOOGLE_API_KEY'],
          authorization: nil,
          application_name: ENV['APPLICATION_NAME'],
          application_version: ENV['APPLICATION_VERSION']
        )

        playlist = YouTube::Playlist.find_by(title: 'Interviews')
        fail unless playlist

        yt = client.discovered_api(ENV['YOUTUBE_API_SERVICE_NAME'], ENV['YOUTUBE_API_VERSION'])

        next_page_token = nil

        items = []

        loop do
          data = client.execute!(
            api_method: yt.playlist_items.list,
            parameters: {
              part: 'snippet',
              maxResults: 50,
              playlistId: playlist.playlist_id,
              pageToken: next_page_token

            }
          ).data

          data.items.each_with_object(items) { |item| items << item }

          next_page_token = data.nextPageToken rescue break
        end

        items.each do |item|
          next if YouTube::Video.exists?(etag: item.etag)

          begin
            video = YouTube::Video.find_or_create_by(video_id: item.snippet.resourceId.videoId) do |v|
              v.video_id    = item.snippet.resourceId.videoId
              v.cache       = item.to_json
              v.etag        = item.etag
              v.title       = item.snippet.title
              v.description = item.snippet.description
            end

            playlist.videos << video

          rescue ActiveRecord::RecordInvalid => rie
            ap [rie, item]
          end
        end
      end

      desc 'Imports YouTube playlists for channel'
      task playlists: %i(dotenv environment) do
        fail 'There are modified Playlist entries. Ensure they are synced back to YouTube before re-importing.' if YouTube::Playlist.exists?(state: 'modified')

        client = Google::APIClient.new(
          key: ENV['GOOGLE_API_KEY'],
          authorization: nil,
          application_name: ENV['APPLICATION_NAME'],
          application_version: ENV['APPLICATION_VERSION']
        )

        yt = client.discovered_api(ENV['YOUTUBE_API_SERVICE_NAME'], ENV['YOUTUBE_API_VERSION'])

        next_page_token = nil

        items = []

        loop do
          data = client.execute!(
            api_method: yt.playlists.list,
            parameters: {
              part: 'snippet',
              channelId: ENV['CHANNEL_ID'],
              pageToken: next_page_token,
              maxResults: 50
            }
          ).data

          data.items.each_with_object(items) { |item| items << item }

          next_page_token = data.nextPageToken rescue break
        end

        items.each do |item|
          next if YouTube::Playlist.exists?(etag: item.etag)

          begin
            YouTube::Playlist.find_or_create_by(playlist_id: item.id) do |playlist|
              playlist.playlist_id = item.id
              playlist.cache       = item.to_json
              playlist.etag        = item.etag
              playlist.title       = item.snippet.title
              playlist.description = item.snippet.description
            end
          rescue ActiveRecord::RecordInvalid => rie
            ap [rie, item]
          end
        end
      end
    end
  end
end
