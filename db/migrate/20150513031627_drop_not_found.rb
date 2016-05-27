# frozen_string_literal: true
class DropNotFound < ActiveRecord::Migration
  def change
    drop_table :not_founds
  end
end
