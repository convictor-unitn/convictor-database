class CreatePhotoNoticesTable < ActiveRecord::Migration

  def self.up
    execute <<-SQL
      CREATE TABLE photo_notices (
        id INTEGER,
        created_at TIMESTAMP,
        updated_at TIMESTAMP,
        photo_id INTEGER,
        registered_user_id INTEGER,
        remove BOOLEAN,
        PRIMARY KEY(id),
        FOREIGN KEY (registered_user_id) REFERENCES users (id),
        FOREIGN KEY (photo_id) REFERENCES photos (id)
      );
    SQL
  end

  def self.down
    execute <<-SQL
      DROP TABLE photo_notices;
    SQL
  end

end
