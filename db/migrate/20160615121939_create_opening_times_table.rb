class CreateOpeningTimesTable < ActiveRecord::Migration

  def self.up
    execute <<-SQL
      CREATE TABLE opening_times (
        id INTEGER,
        created_at TIMESTAMP,
        updated_at TIMESTAMP,
        restaurant_id INTEGER,
        day INTEGER,
        open_at TIME,
        close_at TIME,
        PRIMARY KEY(id),
        FOREIGN KEY (restaurant_id) REFERENCES restaurants (id)
      );
    SQL
  end

  def self.down
    execute <<-SQL
      DROP TABLE opening_times;
    SQL
  end

end
