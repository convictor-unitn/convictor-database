class CreatePhotosTable < ActiveRecord::Migration

  def self.up
    execute <<-SQL
      CREATE TABLE photos (
        id INTEGER,
        created_at TIMESTAMP,
        updated_at TIMESTAMP,
        url TEXT NOT NULL UNIQUE,
        description TEXT,
        restaurant_id INTEGER,
        PRIMARY KEY(id),
        FOREIGN KEY (restaurant_id) REFERENCES restaurants (id)
      );
    SQL
  end

  def self.down
    execute <<-SQL
      DROP TABLE photos;
    SQL
  end

end
