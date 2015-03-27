module YouTube
  class Video < ActiveRecord::Base
    validates :video_id, presence: true, uniqueness: true
    validates :etag, presence: true, uniqueness: true

    validates :title, presence: true, uniqueness: true, length: { in: 1..100 }, format: { without: /(<|>)/, message: "can't contain anglebrackets" }
    validates :description, presence: true, length: { in: 1..5000 }, format: { without: /(<|>)/, multiline: true, message: "can't contain anglebrackets" }

    has_many :playlist_videos
    has_many :playlists, through: :playlist_videos, class_name: 'YouTube::Playlist'

    has_many :transcripts

    def thumbnail(size = 'default')
      @thumbnail ||= {}
      size = size.to_s.downcase

      case size
      when 'default', 'medium', 'high', 'standard'
        @thumbnail[size] ||= OpenStruct.new(cache['snippet']['thumbnails'][size])
      else
        fail "Unknown thumbnail size \"#{size}\"."
      end

      @thumbnail[size]
    end
  end
end

# == Schema Information
#
# Table name: you_tube_videos
#
#  id          :integer          not null, primary key
#  video_id    :string           not null
#  cache       :json
#  etag        :string           not null
#  title       :string           not null
#  description :text
#  state       :string           default("new")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
