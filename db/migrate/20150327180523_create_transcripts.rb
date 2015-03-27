class CreateTranscripts < ActiveRecord::Migration
  def change
    create_table :transcripts do |t|
      t.string :locale
      t.string :video_id
      t.text :text

      t.timestamps null: false
    end
  end
end
