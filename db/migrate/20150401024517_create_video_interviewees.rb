# frozen_string_literal: true
class CreateVideoInterviewees < ActiveRecord::Migration
  def change
    create_table :video_interviewees do |t|
      t.string :video_id
      t.integer :interviewee_id

      t.timestamps null: false
    end
  end
end
