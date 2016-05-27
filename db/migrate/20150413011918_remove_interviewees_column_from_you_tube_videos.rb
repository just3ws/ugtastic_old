# frozen_string_literal: true
class RemoveIntervieweesColumnFromYouTubeVideos < ActiveRecord::Migration
  def change
    remove_column :you_tube_videos, :interviewees
  end
end
