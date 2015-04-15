require 'dotenv/tasks'

namespace :urls do
  desc 'Reload all the friendly url slugs'
  task refresh: %i(dotenv environment) do
    YouTube::Video.update_all(slug: nil)
    YouTube::Video.published.each do |v|
      v.slug = nil
      v.save!
    end
    Rails.logger.ap(YouTube::Video.published.pluck(:slug), :info)
  end
end
