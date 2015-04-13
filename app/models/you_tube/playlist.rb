module YouTube
  class Playlist < ActiveRecord::Base
    has_paper_trail

    include PgSearch
    multisearchable against: %i(title description remote_playlist_id),
                    using: %i(tsearch trigram dmetaphone), ignoring: %i(accents)

    validates :remote_playlist_id, presence: true, uniqueness: true
    validates :etag, presence: true, uniqueness: true

    validates :title, presence: true, uniqueness: true, length: { in: 1..100 }, format: { without: /(<|>)/, message: "can't contain anglebrackets" }
    validates :description, presence: true, length: { in: 1..5000 }, format: { without: /(<|>)/, multiline: true, message: "can't contain anglebrackets" }

    has_many :playlist_videos
    has_many :videos, through: :playlist_videos, class_name: 'YouTube::Video'
  end
end

# == Schema Information
#
# Table name: you_tube_playlists
#
#  id                 :integer          not null, primary key
#  remote_playlist_id :string           not null
#  cache              :json
#  etag               :string           not null
#  title              :string           not null
#  description        :text
#  state              :string           default("new")
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
