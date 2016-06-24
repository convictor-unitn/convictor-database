class AddFulltextSearchToRestaurants < ActiveRecord::Migration
  def self.up
    execute <<-SQL
    ALTER TABLE restaurants ADD COLUMN searchable text;
    CREATE OR REPLACE FUNCTION update_searchable_restaurant_column() RETURNS trigger AS $$
      BEGIN
        NEW.searchable = NEW.name || ' ' || NEW.city || ' ' || NEW.province;
        RETURN NEW;
      END;
$$ LANGUAGE plpgsql;

    CREATE TRIGGER update_searchable_column_restaurant_tg
      BEFORE INSERT OR UPDATE ON restaurants
      FOR EACH ROW EXECUTE PROCEDURE update_searchable_restaurant_column();

    CREATE INDEX restaurant_search_idx ON restaurants USING gin (searchable gin_trgm_ops)
    SQL
  end

  def self.down
    execute <<-SQL
    DROP TRIGGER update_searchable_column_restaurant_tg ON restaurants;
    ALTER TABLE restaurants DROP COLUMN searchable;
    DROP FUNCTION update_searchable_restaurant_column();
    SQL
  end
end
