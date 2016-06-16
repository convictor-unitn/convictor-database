class CreateRestaurantOwnersTable < ActiveRecord::Migration

  def self.up
    execute <<-SQL
      CREATE TABLE restaurant_owners (
        id INTEGER,
        created_at TIMESTAMP,
        updated_at TIMESTAMP,
        user_id INTEGER UNIQUE,
        PRIMARY KEY (id),
        FOREIGN KEY (user_id) REFERENCES users (id)
      );
    SQL
  end

  def self.down
    execute <<-SQL
      DROP TABLE restaurant_owners;
    SQL
  end

end
