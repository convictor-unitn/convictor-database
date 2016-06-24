class AddStreetToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :street, :text
  end
end
