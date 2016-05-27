# frozen_string_literal: true
class CreateYouTubePlaylists < ActiveRecord::Migration
  def up
    create_table :you_tube_playlists do |t|
      t.string :playlist_id, null: false, unique: true

      t.json :cache

      t.string :etag, null: false, unique: true

      t.string :title, null: false, unique: true
      t.text :description
      t.string :state, default: 'new'

      t.timestamps null: false
    end
  end

  def down
    drop_table :you_tube_playlists
  end
end
