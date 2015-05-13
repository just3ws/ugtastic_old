class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :database_authenticatable,
         :registerable, :recoverable,
         :rememberable, :trackable

  has_many :identities, dependent: :destroy

  def twitter
    identities.find_by(provider: 'twitter')
  end

  def twitter_client
    @twitter_client ||= Twitter.client(access_token: twitter.accesstoken)
  end

  def facebook
    identities.find_by(provider: 'facebook')
  end

  def facebook_client
    @facebook_client ||= Facebook.client(access_token: facebook.accesstoken)
  end

  def instagram
    identities.find_by(provider: 'instagram')
  end

  def instagram_client
    @instagram_client ||= Instagram.client(access_token: instagram.accesstoken)
  end

  def google_oauth2
    identities.find_by(provider: 'google_oauth2')
  end

  def google_oauth2_client
    unless @google_oauth2_client
      @google_oauth2_client = Google::APIClient.new(application_name: 'HappySeed App', application_version: '1.0.0')
      @google_oauth2_client.authorization.update_token!(access_token: google_oauth2.accesstoken, refresh_token: google_oauth2.refreshtoken)
    end

    @google_oauth2_client
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#
