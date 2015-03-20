class CreateYouTubeVideos < ActiveRecord::Migration
  def change
    create_table :you_tube_videos, id: false do |t|
      t.json :cache

      t.string :title, unique: true, null: false

      t.timestamps null: false
    end
  end
end
