# frozen_string_literal: true
class AddSlugToInterviewees < ActiveRecord::Migration
  def change
    add_column :interviewees, :slug, :string
    add_index :interviewees, :slug, unique: true
  end
end
