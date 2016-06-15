class CreateUsersTable < ActiveRecord::Migration

  def self.up
    execute <<-SQL
      CREATE TABLE users (
        id INTEGER,
        created_at TIMESTAMP,
        updated_at TIMESTAMP,
        email TEXT NOT NULL,
        password TEXT NOT NULL,
        name TEXT,
        surname TEXT,
        admin BOOLEAN,
        PRIMARY KEY(id)
      );
    SQL
  end

  def self.down
    execute <<-SQL
      DROP TABLE users;
    SQL
  end

end
