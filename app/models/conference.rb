class Conference < ActiveRecord::Base
  has_many :interviews, class_name: 'YouTube::Video', inverse_of: :conference

  include PgSearch
  multisearchable against: %i(name year country homepage city address), using: %i(tsearch trigram dmetaphone), ignoring: %i(accents)

  validates :name, presence: true
  validates :year, presence: true
end

# == Schema Information
#
# Table name: conferences
#
#  id         :integer          not null, primary key
#  name       :string
#  year       :integer
#  country    :string
#  homepage   :string
#  city       :string
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  latitude   :float
#  longitude  :float
#
