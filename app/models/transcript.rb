class Transcript < ActiveRecord::Base
  enum status: %i(transcription caption)

  belongs_to :video, class_name: 'YouTube::Video'
end
