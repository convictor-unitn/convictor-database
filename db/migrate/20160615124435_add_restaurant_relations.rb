class AddRestaurantRelations < ActiveRecord::Migration
  def self.up
    execute <<-SQL
      ALTER TABLE restaurants
        ADD CONSTRAINT fk_restaurant_slot_price
        FOREIGN KEY (slot_price) REFERENCES price_slots (id),
        ADD CONSTRAINT fk_restaurant_main_photo
        FOREIGN KEY (main_photo_id) REFERENCES photos (id),
        ADD CONSTRAINT fk_restaurant_owner
        FOREIGN KEY (restaurant_owner_id) REFERENCES users (id);
    SQL
  end

  def self.down
    execute <<-SQL
      ALTER TABLE restaurants
        DROP CONSTRAINT fk_restaurant_slot_price,
        DROP CONSTRAINT fk_restaurant_main_photo,
        DROP CONSTRAINT fk_restaurant_owner;
    SQL
  end
end
