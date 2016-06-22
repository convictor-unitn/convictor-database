class AddTriggersForTimestamps < ActiveRecord::Migration
  @@tables = [ :cusines,
               :cusines_restaurants,
               :opening_times,
               :ownership_notices,
               :photo_notices,
               :photo_remove_notices,
               :photos,
               :price_slots,
               :restaurant_owners,
               :restaurants,
               :review_notices,
               :reviews,
               :users
  ]

  def self.up
    execute <<-SQL
-- Checking if required extensions are installed
CREATE EXTENSION IF NOT EXISTS plpgsql;

-- Adding a function for updating created_at and updated_at
CREATE OR REPLACE FUNCTION set_timestamps_function() RETURNS trigger AS $$
  BEGIN
    IF TG_OP = 'INSERT' THEN
      NEW.created_at = CURRENT_TIMESTAMP AT TIME ZONE 'UTC';
      NEW.updated_at = CURRENT_TIMESTAMP AT TIME ZONE 'UTC';
    ELSIF TG_OP ='UPDATE' THEN
      NEW.updated_at = CURRENT_TIMESTAMP AT TIME ZONE 'UTC';
    END IF;
    RETURN NEW;
  END;
$$ LANGUAGE plpgsql;

SQL

    @@tables.each() do |i|
      execute <<-SQL
CREATE TRIGGER set_timestamp_tg
BEFORE INSERT OR UPDATE ON #{i}
FOR EACH ROW EXECUTE PROCEDURE set_timestamps_function();
SQL
    end

  end

  def self.down
    @@tables.each() do |i|
      execute <<-SQL
DROP TRIGGER IF EXISTS set_timestamp_tg ON #{i}
      SQL
    end
    execute <<-SQL
DROP FUNCTION set_timestamps_function();
    SQL
  end
end
