# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_30_175334) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "measure_items", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_measure_items_on_name", unique: true
  end

  create_table "measurements", force: :cascade do |t|
    t.float "value", null: false
    t.string "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "users_id"
    t.bigint "measure_items_id"
    t.bigint "user_id"
    t.index ["measure_items_id"], name: "index_measurements_on_measure_items_id"
    t.index ["user_id"], name: "index_measurements_on_user_id"
    t.index ["users_id"], name: "index_measurements_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["username", "email"], name: "index_users_on_username_and_email", unique: true
  end

  add_foreign_key "measurements", "measure_items", column: "measure_items_id"
  add_foreign_key "measurements", "users"
  add_foreign_key "measurements", "users", column: "users_id"
end
