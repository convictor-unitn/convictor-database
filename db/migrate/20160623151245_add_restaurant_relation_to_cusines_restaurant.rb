class AddRestaurantRelationToCusinesRestaurant < ActiveRecord::Migration
  def self.up
    execute <<-SQL
      ALTER TABLE cusines_restaurants
        ADD CONSTRAINT fk_restaurant_cusines_id
        FOREIGN KEY (restaurant_id) REFERENCES restaurants (id);
    SQL
  end
  def self.down
    execute <<-SQL
      ALTER TABLE cusines_restaurants
        DROP CONSTRAINT fk_restaurant_cusines_id;
    SQL
  end
end
