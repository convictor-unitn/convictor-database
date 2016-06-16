class CreateCusinesTable < ActiveRecord::Migration

  def self.up
    execute <<-SQL
      CREATE TABLE cusines (
        id INTEGER,
        created_at TIMESTAMP,
        updated_at TIMESTAMP,
        name TEXT UNIQUE,
        PRIMARY KEY(id)
      );
    SQL
  end

  def self.down
    execute <<-SQL
      DROP TABLE cusines;
    SQL
  end

end
