class AddContextNameSubtitleToYouTubeVideos < ActiveRecord::Migration
  def change
    add_column :you_tube_videos, :context,  :string
    add_column :you_tube_videos, :name,     :string
    add_column :you_tube_videos, :subtitle, :string
  end
end
