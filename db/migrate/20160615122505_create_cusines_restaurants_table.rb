class CreateCusinesRestaurantsTable < ActiveRecord::Migration

  def self.up
    execute <<-SQL
      CREATE TABLE cusines_restaurants (
        id INTEGER,
        created_at TIMESTAMP,
        updated_at TIMESTAMP,
        photo_id INTEGER,
        restaurant_id INTEGER,
        cusine_id INTEGER,
        PRIMARY KEY(id)
      );
    SQL
  end

  def self.down
    execute <<-SQL
      DROP TABLE cusines_restaurants;
    SQL
  end

end
