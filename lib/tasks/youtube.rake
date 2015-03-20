require 'dotenv/tasks'

require 'google/api_client'

namespace :youtube do
  desc 'Run everything.'
  task list: %i(dotenv environment) do
    YOUTUBE_API_SERVICE_NAME = 'youtube'
    YOUTUBE_API_VERSION = 'v3'

    client = Google::APIClient.new(
      key: ENV['GOOGLE_API_KEY'],
      authorization: nil,
      application_name: ENV['APPLICATION_NAME'],
      application_version: ENV['APPLICATION_VERSION']
    )

    youtube = client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)

    next_page_token = nil

    items = []

    loop do
      data = client.execute!(api_method: youtube.playlists.list, parameters: { part: 'snippet', channelId: ENV['CHANNEL_ID'], pageToken: next_page_token, maxResults: 50 }).data

      data.items.each_with_object(items) { |item| items << item }

      if data.respond_to?(:nextPageToken)
        next_page_token = data.nextPageToken
      else
        break
      end

      puts next_page_token
    end

    ap items
  end
end
