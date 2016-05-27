# frozen_string_literal: true
class CreateTranscripts < ActiveRecord::Migration
  def change
    create_table :transcripts do |t|
      t.string :locale
      t.string :video_id
      t.text :text
      t.integer :format, default: 0

      t.timestamps null: false
    end
  end
end
