class AddEmailAndPhoneToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :email, :text
    add_column :restaurants, :phone, :text
  end
end
