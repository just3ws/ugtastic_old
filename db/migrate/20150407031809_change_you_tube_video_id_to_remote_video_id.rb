# frozen_string_literal: true
class ChangeYouTubeVideoIdToRemoteVideoId < ActiveRecord::Migration
  def change
    rename_column :you_tube_videos, :video_id, :remote_video_id
  end
end
