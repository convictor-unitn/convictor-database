class AlterPhotoNoticesTable < ActiveRecord::Migration

  def self.up
    execute <<-SQL
      ALTER TABLE photo_notices DROP COLUMN remove;
    SQL
  end

  def self.down
    execute <<-SQL
      ALTER TABLE photo_notices ADD remove BOOLEAN;
    SQL
  end

end
