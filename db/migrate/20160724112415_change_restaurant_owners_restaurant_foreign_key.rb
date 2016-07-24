class ChangeRestaurantOwnersRestaurantForeignKey < ActiveRecord::Migration
  def change
    remove_foreign_key :restaurants, column: :restaurant_owner_id
    add_foreign_key :restaurants, :restaurant_owners
  end
end
