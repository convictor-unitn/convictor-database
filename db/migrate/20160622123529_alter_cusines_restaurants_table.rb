class AlterCusinesRestaurantsTable < ActiveRecord::Migration

  def self.up
    execute <<-SQL
      ALTER TABLE cusines_restaurants DROP COLUMN photo_id;
    SQL
  end

  def self.down
    execute <<-SQL
      ALTER TABLE cusines_restaurants ADD photo_id INTEGER;
    SQL
  end
end
