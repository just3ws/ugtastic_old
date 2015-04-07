class ChangeVideoIntervieweesVideoIdToInteger < ActiveRecord::Migration
  def change
    change_column :video_interviewees, :video_id, 'integer USING CAST(video_id AS integer)'
  end
end
