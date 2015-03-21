module YouTube
  class Playlist < ActiveRecord::Base
    validates :playlist_id, presence: true, uniqueness: true
    validates :etag, presence: true, uniqueness: true
    validates :title, presence: true, uniqueness: true

    has_many :playlist_videos
    has_many :videos, through: :playlist_videos, class_name: 'YouTube::Video'
  end
end

# == Schema Information
#
# Table name: you_tube_playlists
#
#  id          :integer          not null, primary key
#  playlist_id :string           not null
#  cache       :json
#  etag        :string           not null
#  title       :string           not null
#  description :text
#  state       :string           default("new")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
