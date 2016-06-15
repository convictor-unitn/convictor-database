class AddReviewsRelations < ActiveRecord::Migration
  def self.up
    execute <<-SQL
      ALTER TABLE reviews
        ADD CONSTRAINT fk_review_owner
        FOREIGN KEY (registered_user_id) REFERENCES users (id),
        ADD CONSTRAINT fk_restaurant_reviewed
        FOREIGN KEY (restaurant_id) REFERENCES restaurants (id);
    SQL
  end

  def self.down
    execute <<-SQL
      ALTER TABLE reviews
        DROP CONSTRAINT fk_review_owner,
        DROP CONSTRAINT fk_restaurant_reviewed;
    SQL
  end
end
