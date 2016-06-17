class ConvertAllIdsToSerial < ActiveRecord::Migration
    @@tables = [ :cusines,
                    :cusines_restaurants,
                    :opening_times,
                    :ownership_notices,
                    :photo_notices,
                    :photos,
                    :price_slots,
                    :restaurant_owners,
                    :restaurants,
                    :review_notices,
                    :reviews,
                    :users
    ]

  def self.up
    @@tables.each() do |i|
      execute <<SQL
CREATE SEQUENCE #{i}_id_seq;
ALTER SEQUENCE #{i}_id_seq OWNED BY cusines.id;
ALTER TABLE #{i} ALTER COLUMN id SET DEFAULT nextval('#{i}_id_seq');
SQL
    end
  end

  def self.down
SQL
    @@tables.each() do |i|
      execute <<SQL
ALTER TABLE #{i} ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE #{i}_id_seq;
SQL
    end
  end
end
