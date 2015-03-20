require 'dotenv/tasks'
require 'google/api_client'

namespace :you_tube do
  namespace :import do

    namespace :channel do
      desc 'Imports YouTube playlists for channel'
      task playlists: %i(dotenv environment) do
        fail 'There are modified Playlist entries. Ensure they are synced back to YouTube before re-importing.' if YouTube::Playlist.exists?(state: 'modified')

        client = Google::APIClient.new(
          key: ENV['GOOGLE_API_KEY'],
          authorization: nil,
          application_name: ENV['APPLICATION_NAME'],
          application_version: ENV['APPLICATION_VERSION']
        )

        you_tube = client.discovered_api(ENV['YOUTUBE_API_SERVICE_NAME'], ENV['YOUTUBE_API_VERSION'])

        next_page_token = nil

        items = []

        loop do
          data = client.execute!(
            api_method: you_tube.playlists.list,
            parameters: {
              part: 'snippet',
              channelId: ENV['CHANNEL_ID'],
              pageToken: next_page_token,
              maxResults: 50
            }
          ).data

          data.items.each_with_object(items) { |item| items << item }

          if data.respond_to?(:nextPageToken)
            next_page_token = data.nextPageToken
          else
            break
          end
        end

        items.each do |item|
          YouTube::Playlist.find_or_create_by(playlist_id: item.id) do |playlist|
            next if playlist.etag == item.etag

            playlist.cache       = item.to_json
            playlist.etag        = item.etag
            playlist.title       = item.snippet.title
            playlist.description = item.snippet.description
          end
        end
      end
    end
  end
end
