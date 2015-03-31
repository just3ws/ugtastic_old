class Transcript < ActiveRecord::Base
  enum status: %i(transcription caption)

  belongs_to :video, class_name: 'YouTube::Video'
end

# == Schema Information
#
# Table name: transcripts
#
#  id         :integer          not null, primary key
#  locale     :string
#  video_id   :string
#  text       :text
#  format     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
