module YouTube
  class PlaylistVideo < ActiveRecord::Base
    belongs_to :playlist, class_name: 'YouTube::Playlist'
    belongs_to :video, class_name: 'YouTube::Video'

    validates :playlist, presence: true
    validates :video, presence: true
  end
end

# == Schema Information
#
# Table name: you_tube_playlist_videos
#
#  id          :integer          not null, primary key
#  playlist_id :integer          not null
#  video_id    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
