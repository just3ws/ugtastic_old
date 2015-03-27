class Transcript < ActiveRecord::Base
  belongs_to :video, class_name: 'YouTube::Video'
end
