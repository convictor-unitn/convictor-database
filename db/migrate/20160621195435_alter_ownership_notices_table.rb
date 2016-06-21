class AlterOwnershipNoticesTable < ActiveRecord::Migration

  def self.up
    execute <<-SQL
      ALTER TABLE ownership_notices ADD approved BOOLEAN;
    SQL
  end

  def self.down
    execute <<-SQL
      ALTER TABLE ownership_notices DROP COLUMN approved;
    SQL
  end

end
