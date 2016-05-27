# frozen_string_literal: true
class ChangeYouTubePlaylistIdToRemotePlaylistId < ActiveRecord::Migration
  def change
    rename_column :you_tube_playlists, :playlist_id, :remote_playlist_id
  end
end
