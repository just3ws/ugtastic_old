class VideoInterviewee < ActiveRecord::Base
  belongs_to :video, class_name: 'YouTube::Video'
  validates :video, presence: true

  belongs_to :interviewee
  validates :interviewee, presence: true
end

# == Schema Information
#
# Table name: video_interviewees
#
#  id             :integer          not null, primary key
#  video_id       :string
#  interviewee_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
