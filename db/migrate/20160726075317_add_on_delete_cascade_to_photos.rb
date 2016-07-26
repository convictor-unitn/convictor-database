class AddOnDeleteCascadeToPhotos < ActiveRecord::Migration
  def change
    remove_foreign_key :restaurants, column: :main_photo_id
    remove_foreign_key :photo_notices, column: :photo_id
    remove_foreign_key :photo_remove_notices, column: :photo_id
    add_foreign_key :restaurants, :photos, column: :main_photo_id, on_delete: :cascade, on_update: :cascade
    add_foreign_key :photo_notices, :photos, column: :photo_id, on_delete: :cascade, on_update: :cascade
    add_foreign_key :photo_remove_notices, :photos, column: :photo_id, on_delete: :cascade, on_update: :cascade

  end
end
