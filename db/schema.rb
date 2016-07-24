# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160724090422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"

  create_table "cusines", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "name"
  end

  add_index "cusines", ["name"], name: "cusines_name_key", unique: true, using: :btree

  create_table "cusines_restaurants", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "restaurant_id"
    t.integer  "cusine_id"
  end

  add_index "cusines_restaurants", ["restaurant_id", "cusine_id"], name: "cusines_restaurants_restaurant_id_cusine_id_key", unique: true, using: :btree

  create_table "opening_times", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "restaurant_id"
    t.integer  "day"
    t.time     "open_at"
    t.time     "close_at"
    t.time     "open_at_afternoon"
    t.time     "close_at_afternoon"
    t.boolean  "dayoff",             default: false
  end

  create_table "ownership_notices", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "registered_user_id"
    t.integer  "restaurant_id"
    t.boolean  "approved"
    t.string   "company_name",       null: false
    t.string   "vat_number",         null: false
    t.string   "tax_code",           null: false
    t.string   "contact_phone",      null: false
  end

  create_table "photo_notices", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "photo_id"
    t.integer  "registered_user_id"
  end

  create_table "photo_remove_notices", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "registered_user_id"
    t.integer  "photo_id"
    t.boolean  "approved"
  end

  create_table "photos", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "url",           null: false
    t.text     "description"
    t.integer  "restaurant_id"
  end

  add_index "photos", ["url"], name: "photos_url_key", unique: true, using: :btree

  create_table "price_slots", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "slot"
    t.text     "name"
  end

  add_index "price_slots", ["name"], name: "price_slots_name_key", unique: true, using: :btree
  add_index "price_slots", ["slot"], name: "price_slots_slot_key", unique: true, using: :btree

  create_table "restaurant_owners", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "restaurant_owners", ["user_id"], name: "restaurant_owners_user_id_key", unique: true, using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "name"
    t.text     "description"
    t.text     "city"
    t.text     "zip_code"
    t.text     "province"
    t.text     "full_address"
    t.text     "website"
    t.integer  "slot_price",          default: 0
    t.integer  "rating",              default: 0
    t.integer  "main_photo_id"
    t.integer  "restaurant_owner_id"
    t.text     "street"
    t.text     "email"
    t.text     "phone"
    t.text     "searchable"
    t.float    "lat",                 default: 0.0, null: false
    t.float    "lng",                 default: 0.0, null: false
    t.tsvector "tsv"
    t.string   "company_name"
    t.string   "vat_number"
    t.string   "fiscal_code"
  end

  add_index "restaurants", ["searchable"], name: "restaurant_search_idx", using: :gin
  add_index "restaurants", ["tsv"], name: "restaurant_fulltext_search_idx", using: :gin

  create_table "review_notices", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "review_id"
    t.integer  "registered_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "registered_user_id"
    t.integer  "restaurant_id"
    t.text     "description"
    t.integer  "rating"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "email",                  null: false
    t.text     "password",               null: false
    t.text     "name"
    t.text     "surname"
    t.boolean  "admin"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
  end

  add_index "users", ["email"], name: "users_email_key", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "cusines_restaurants", "cusines", name: "cusines_restaurants_cusine_id_fkey"
  add_foreign_key "cusines_restaurants", "restaurants", name: "fk_restaurant_cusines_id"
  add_foreign_key "opening_times", "restaurants", name: "opening_times_restaurant_id_fkey"
  add_foreign_key "ownership_notices", "restaurants", name: "ownership_notices_restaurant_id_fkey"
  add_foreign_key "ownership_notices", "users", column: "registered_user_id", name: "ownership_notices_registered_user_id_fkey"
  add_foreign_key "photo_notices", "photos", name: "photo_notices_photo_id_fkey"
  add_foreign_key "photo_notices", "users", column: "registered_user_id", name: "photo_notices_registered_user_id_fkey"
  add_foreign_key "photo_remove_notices", "photos", name: "photo_remove_notices_photo_id_fkey"
  add_foreign_key "photo_remove_notices", "users", column: "registered_user_id", name: "photo_remove_notices_registered_user_id_fkey"
  add_foreign_key "photos", "restaurants", name: "photos_restaurant_id_fkey"
  add_foreign_key "restaurant_owners", "users", name: "restaurant_owners_user_id_fkey"
  add_foreign_key "restaurants", "photos", column: "main_photo_id", name: "fk_restaurant_main_photo"
  add_foreign_key "restaurants", "price_slots", column: "slot_price", name: "fk_restaurant_slot_price"
  add_foreign_key "restaurants", "users", column: "restaurant_owner_id", name: "fk_restaurant_owner"
  add_foreign_key "review_notices", "reviews", name: "review_notices_review_id_fkey"
  add_foreign_key "review_notices", "users", column: "registered_user_id", name: "review_notices_registered_user_id_fkey"
  add_foreign_key "reviews", "restaurants", name: "fk_restaurant_reviewed"
  add_foreign_key "reviews", "users", column: "registered_user_id", name: "fk_review_owner"
end
