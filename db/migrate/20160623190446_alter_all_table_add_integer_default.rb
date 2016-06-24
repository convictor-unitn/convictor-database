class AlterAllTableAddIntegerDefault < ActiveRecord::Migration
  def self.up
    execute <<-SQL
      ALTER TABLE restaurants ALTER COLUMN slot_price SET DEFAULT 0;
      ALTER TABLE restaurants ALTER COLUMN rating SET DEFAULT 0;

    SQL
  end

  def self.down
    execute <<-SQL
       ALTER TABLE restaurants ALTER COLUMN slot_price DROP DEFAULT;
      ALTER TABLE restaurants ALTER COLUMN rating DROP DEFAULT;
    SQL
  end
end
