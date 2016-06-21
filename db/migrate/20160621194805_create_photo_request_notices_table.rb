class CreatePhotoRequestNoticesTable < ActiveRecord::Migration
  def self.up
    execute <<-SQL
      CREATE TABLE photo_remove_notices (
        id SERIAL,
        created_at TIMESTAMP,
        updated_at TIMESTAMP,
        registered_user_id INTEGER,
        photo_id INTEGER,
        approved BOOLEAN,
        FOREIGN KEY (registered_user_id) REFERENCES users,
        FOREIGN KEY (photo_id) REFERENCES photos,
        PRIMARY KEY(id)
      );
    SQL
  end

  def self.down
    execute <<-SQL
      DROP TABLE photo_remove_notices;
    SQL
  end

end
