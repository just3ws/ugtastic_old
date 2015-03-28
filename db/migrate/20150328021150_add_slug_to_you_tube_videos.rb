class AddSlugToYouTubeVideos < ActiveRecord::Migration
  def change
    add_column :you_tube_videos, :slug, :string
    add_index :you_tube_videos, :slug, unique: true
  end
end
