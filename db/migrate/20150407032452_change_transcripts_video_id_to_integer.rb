class ChangeTranscriptsVideoIdToInteger < ActiveRecord::Migration
  def change
    change_column :transcripts, :video_id, 'integer USING CAST(video_id AS integer)'
  end
end
