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

ActiveRecord::Schema[8.0].define(version: 2025_11_20_202624) do
  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.integer "age"
    t.string "size"
    t.string "energy_level"
    t.string "temperament"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_dogs_on_user_id"
  end

  create_table "meetup_attendances", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "meetup_id", null: false
    t.datetime "joined_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meetup_id"], name: "index_meetup_attendances_on_meetup_id"
    t.index ["user_id"], name: "index_meetup_attendances_on_user_id"
  end

  create_table "meetups", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.float "latitude"
    t.float "longitude"
    t.string "dog_size_pref"
    t.string "dog_energy_pref"
    t.integer "organizer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organizer_id"], name: "index_meetups_on_organizer_id"
  end

  create_table "parks", force: :cascade do |t|
    t.string "name"
    t.float "latitude"
    t.float "longitude"
    t.boolean "dog_friendly"
    t.text "features"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "snap_reactions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "snap_id", null: false
    t.string "emoji"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["snap_id"], name: "index_snap_reactions_on_snap_id"
    t.index ["user_id"], name: "index_snap_reactions_on_user_id"
  end

  create_table "snaps", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "meetup_id", null: false
    t.string "media"
    t.string "text"
    t.datetime "expires_at"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meetup_id"], name: "index_snaps_on_meetup_id"
    t.index ["user_id"], name: "index_snaps_on_user_id"
  end

  create_table "trust_feedbacks", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "meetup_id", null: false
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meetup_id"], name: "index_trust_feedbacks_on_meetup_id"
    t.index ["user_id"], name: "index_trust_feedbacks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "avatar"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "dogs", "users"
  add_foreign_key "meetup_attendances", "meetups"
  add_foreign_key "meetup_attendances", "users"
  add_foreign_key "meetups", "organizers"
  add_foreign_key "snap_reactions", "snaps"
  add_foreign_key "snap_reactions", "users"
  add_foreign_key "snaps", "meetups"
  add_foreign_key "snaps", "users"
  add_foreign_key "trust_feedbacks", "meetups"
  add_foreign_key "trust_feedbacks", "users"
end
