class CreateRestaurantOwnersTable < ActiveRecord::Migration

  def self.up
    execute <<-SQL
      CREATE TABLE restaurant_owners (
        id INTEGER UNIQUE NOT NULL,
        created_at TIMESTAMP,
        updated_at TIMESTAMP
      );
    SQL
  end

  def self.down
    execute <<-SQL
      DROP TABLE restaurant_owners;
    SQL
  end

end
