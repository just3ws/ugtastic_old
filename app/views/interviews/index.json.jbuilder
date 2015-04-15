json.array!(@you_tube_videos) do |you_tube_video|
  json.extract! you_tube_video, :id
  json.url interview_url(you_tube_video, format: :json)
end
