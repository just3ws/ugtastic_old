class CreateYouTubePlaylists < ActiveRecord::Migration
  def change
    create_table :you_tube_playlists, id: false do |t|
      t.string :playlist_id, null: false, unique: true
      t.json :cache

      t.string :etag, null: false, unique: true

      t.string :title, null: false, unique: true
      t.text :description
      t.string :state, default: 'new'

      t.timestamps null: false
    end
    execute 'ALTER TABLE you_tube_playlists ADD PRIMARY KEY (playlist_id);'
  end
end
