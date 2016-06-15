class CreateCusinesTable < ActiveRecord::Migration

  def self.up
    execute <<-SQL
      CREATE TABLE cusines_notices (
        id INTEGER,
        created_at TIMESTAMP,
        updated_at TIMESTAMP,
        name TEXT,
        PRIMARY KEY(id)
      );
    SQL
  end

  def self.down
    execute <<-SQL
      DROP TABLE cusines_notices;
    SQL
  end

end
