class CreateOwnershipNoticeTable < ActiveRecord::Migration

  def self.up
    execute <<-SQL
      CREATE TABLE ownership_notices (
        id INTEGER,
        created_at TIMESTAMP,
        updated_at TIMESTAMP,
        registered_user_id INTEGER,
        restaurant_id INTEGER,
        PRIMARY KEY(id),
        FOREIGN KEY (registered_user_id) REFERENCES users (id),
        FOREIGN KEY (restaurant_id) REFERENCES restaurants (id)
      );
    SQL
  end

  def self.down
    execute <<-SQL
      DROP TABLE ownership_notices;
    SQL
  end

end
