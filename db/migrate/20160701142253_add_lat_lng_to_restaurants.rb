class AddLatLngToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :lat, :"double precision", default: 0.0, null: false
    add_column :restaurants, :lng, :"double precision", default: 0.0, null: false
  end
end
