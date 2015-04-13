class ChangeConferenceLatitudeToFloat < ActiveRecord::Migration
  def change
    remove_column :conferences, :latitude
    remove_column :conferences, :longitude

    add_column :conferences, :latitude, :float
    add_column :conferences, :longitude, :float
  end
end
