module YouTube
  class Playlist < ActiveRecord::Base
    validates :playlist_id, presence: true, uniqueness: true
    validates :etag, presence: true, uniqueness: true
    validates :title, presence: true, uniqueness: true
  end
end
