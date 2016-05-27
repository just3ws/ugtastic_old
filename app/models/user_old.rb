# frozen_string_literal: true
class UserOld < ActiveRecord::Base
  enum role: %i(user vip admin)
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= if User.count == 0
                    :admin
                  else
                    :user
                  end
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['name'] || '' if auth['info']
    end
  end

  rails_admin do
    configure :role do
      searchable false
    end
  end
end

# == Schema Information
#
# Table name: user_olds
#
#  id         :integer          not null, primary key
#  name       :string
#  provider   :string
#  uid        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  role       :integer
#
