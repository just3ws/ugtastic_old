require 'dotenv/tasks'

namespace :one_off do
  desc 'Convert these to hidden interviews'
  task hide_videos: %i(dotenv environment) do
    [
      '[REPLACED] Liz Abinante co-leader Girl Develop It Chicago',
      '[ROUGH CUT] Interview with Charles Nutter aka the JRuby Guy at GOTO Night Chicago 2015'
    ].each do |title|
      YouTube::Video.find_by(title: title).update_attribute(:status, YouTube::Video.statuses[:hide])
    end
  end
end
