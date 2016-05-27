# frozen_string_literal: true
class CreateYouTubePlaylistVideos < ActiveRecord::Migration
  def change
    create_table :you_tube_playlist_videos do |t|
      t.integer :playlist_id, null: false
      t.integer :video_id, null: false

      t.timestamps null: false
    end

    add_index :you_tube_playlist_videos, :playlist_id
    add_index :you_tube_playlist_videos, :video_id
    add_index :you_tube_playlist_videos, %i(video_id playlist_id)
  end
end
