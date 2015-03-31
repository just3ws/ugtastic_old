class AddIntervieweesToYouTubeVideos < ActiveRecord::Migration
  def change
    add_column :you_tube_videos, :interviewees, :string, array: true
  end
end
