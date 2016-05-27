# frozen_string_literal: true
class AddConferenceIdToYouTubeVideo < ActiveRecord::Migration
  def change
    add_column :you_tube_videos, :conference_id, :integer
  end
end
