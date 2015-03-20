class CreateYouTubeVideos < ActiveRecord::Migration
  def change
    create_table :you_tube_videos, id: false do |t|
      t.string :video_id, null: false, unique: true

      t.json :cache

      t.string :etag, null: false, unique: true

      t.string :title, null: false, unique: true

      t.text :description
      t.string :state, default: 'new'

      t.timestamps null: false
    end
    execute 'ALTER TABLE you_tube_videos ADD PRIMARY KEY (video_id);'
  end
end
