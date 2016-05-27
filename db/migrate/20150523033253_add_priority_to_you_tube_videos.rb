# frozen_string_literal: true
class AddPriorityToYouTubeVideos < ActiveRecord::Migration
  def change
    add_column :you_tube_videos, :priority, :integer, default: 0
  end
end
