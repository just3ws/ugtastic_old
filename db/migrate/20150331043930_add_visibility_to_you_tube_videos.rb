# frozen_string_literal: true
class AddVisibilityToYouTubeVideos < ActiveRecord::Migration
  def change
    add_column :you_tube_videos, :status, :integer, default: 0, null: false
    execute 'update you_tube_videos set status = 0 where status is null;'
  end
end
