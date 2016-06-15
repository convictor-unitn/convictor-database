class CreateReviewNoticesTable < ActiveRecord::Migration

  def self.up
    execute <<-SQL
      CREATE TABLE review_notices (
        id INTEGER,
        created_at TIMESTAMP,
        updated_at TIMESTAMP,
        review_id INTEGER,
        registered_user_id INTEGER,
        PRIMARY KEY(id),
        FOREIGN KEY (registered_user_id) REFERENCES users (id),
        FOREIGN KEY (review) REFERENCES reviews (id)
      );
    SQL
  end

  def self.down
    execute <<-SQL
      DROP TABLE review_notices;
    SQL
  end

end
