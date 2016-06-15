class CreatePriceSlotsTable < ActiveRecord::Migration

  def self.up
    execute <<-SQL
      CREATE TABLE price_slots (
        id INTEGER,
        created_at TIMESTAMP,
        updated_at TIMESTAMP,
        slot INTEGER,
        name text,
        PRIMARY KEY(id)
      );
    SQL
  end

  def self.down
    execute <<-SQL
      DROP TABLE price_slots;
    SQL
  end

end
