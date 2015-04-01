class Interviewee < ActiveRecord::Base
  has_paper_trail

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :video_interviewees
  has_many :videos, through: :video_interviewees, class_name: 'YouTube::Video'
end
