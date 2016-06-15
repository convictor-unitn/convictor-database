class CreateRestaurantTable < ActiveRecord::Migration

  def self.up
    execute <<-SQL
      CREATE TABLE restaurants (
        id INTEGER ,
        created_at TIMESTAMP,
        updated_at TIMESTAMP,
        name TEXT,
        description TEXT,
        city TEXT,
        zip_code TEXT,
        province TEXT,
        full_address TEXT,
        website TEXT,
        slot_price INTEGER,
        rating INTEGER,
        main_photo_id INTEGER,
        restaurant_owner_id INTEGER,
        PRIMARY KEY(id)
      );
    SQL
  end

  # Inverse method, destroy the table created
  def self.down
    execute <<-SQL
      DROP TABLE restaurants;
    SQL
  end

end
