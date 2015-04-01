class VideoInterviewee < ActiveRecord::Base
  belongs_to :video, class_name: 'YouTube::Video'
  validates :video, presence: true

  belongs_to :interviewee
  validates :interviewee, presence: true
end
