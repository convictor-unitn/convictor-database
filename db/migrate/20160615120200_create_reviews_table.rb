class CreateReviewsTable < ActiveRecord::Migration

  def self.up
    execute <<-SQL
      CREATE TABLE reviews (
        id INTEGER,
        created_at TIMESTAMP,
        updated_at TIMESTAMP,
        registered_user_id INTEGER,
        restaurant_id INTEGER,
        description TEXT,
        rating INTEGER,
        PRIMARY KEY (id)
      );
    SQL
  end

  def self.down
    execute <<-SQL
      DROP TABLE reviews;
    SQL
  end

end
