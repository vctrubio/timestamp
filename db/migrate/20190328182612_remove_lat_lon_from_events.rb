class RemoveLatLonFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :latitude, :float
    remove_column :events, :longitude, :float
  end
end
