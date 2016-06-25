class RestructureOpeningTimesRestaurant < ActiveRecord::Migration
  def self.up
    execute <<-SQL
      ALTER TABLE opening_times
        ADD open_at_afternoon time,
        ADD close_at_afternoon time,
        ADD dayoff boolean;
      ALTER TABLE opening_times
        ALTER COLUMN dayoff SET DEFAULT false;
    SQL
  end
  def self.down
    execute <<-SQL
      ALTER TABLE opening_times
        DROP open_at_afternoon,
        DROP close_at_afternoon,
        DROP dayoff;
    SQL
  end

end
