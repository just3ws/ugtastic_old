class Interviewee < ActiveRecord::Base
  has_paper_trail

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, presence: true, uniqueness: true, allow_blank: false

  has_many :video_interviewees
  has_many :videos, -> { uniq }, through: :video_interviewees, class_name: 'YouTube::Video'
end

# == Schema Information
#
# Table name: interviewees
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#
