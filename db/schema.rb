# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_30_175002) do
  create_table "profiles", force: :cascade do |t|
    t.string "username", limit: 255, null: false
    t.boolean "superuser", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_profiles_on_username"
  end

  create_table "repositories", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.text "tags", limit: 1024, null: false
    t.integer "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_repositories_on_profile_id"
  end

  create_table "view_counts", force: :cascade do |t|
    t.string "path", null: false
    t.integer "views", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "repositories", "profiles"
end
