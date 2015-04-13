class Conference < ActiveRecord::Base
end

# == Schema Information
#
# Table name: conferences
#
#  id         :integer          not null, primary key
#  name       :string
#  year       :integer
#  country    :string
#  latitude   :float
#  homepage   :string
#  longitude  :string
#  city       :string
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
