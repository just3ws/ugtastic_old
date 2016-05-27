# frozen_string_literal: true
class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :name

      t.integer :year

      t.string :homepage

      t.float :latitude
      t.string :longitude

      t.string :venue
      t.string :city
      t.string :country
      t.text :address

      t.timestamps null: false
    end
  end
end
