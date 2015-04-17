class NotFound < ActiveRecord::Base
  validates :url, presence: true
end

# == Schema Information
#
# Table name: not_founds
#
#  id         :uuid             not null, primary key
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
