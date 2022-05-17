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

ActiveRecord::Schema.define(version: 2022_05_16_214440) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.boolean "is_confirmed"
    t.bigint "user_id", null: false
    t.bigint "timeslot_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["timeslot_id"], name: "index_bookings_on_timeslot_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "matches", force: :cascade do |t|
    t.boolean "is_notified"
    t.bigint "search_id", null: false
    t.bigint "offer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["offer_id"], name: "index_matches_on_offer_id"
    t.index ["search_id"], name: "index_matches_on_search_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "location"
    t.string "size"
    t.string "condition"
    t.string "style"
    t.integer "price"
    t.string "material"
    t.boolean "smoke_free"
    t.boolean "pet_free"
    t.boolean "receipt"
    t.string "color"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "category"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "title"
    t.string "location"
    t.string "size"
    t.string "condition"
    t.string "style"
    t.string "material"
    t.boolean "smoke_free"
    t.boolean "pet_free"
    t.boolean "receipt"
    t.string "color"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_searches_on_user_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.boolean "is_favorite"
    t.boolean "is_requested"
    t.boolean "is_deleted"
    t.bigint "user_id", null: false
    t.bigint "offer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["offer_id"], name: "index_statuses_on_offer_id"
    t.index ["user_id"], name: "index_statuses_on_user_id"
  end

  create_table "timeslots", force: :cascade do |t|
    t.datetime "timeslot"
    t.bigint "offer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["offer_id"], name: "index_timeslots_on_offer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "fname"
    t.string "lname"
    t.string "phone"
    t.string "location"
    t.boolean "is_admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "timeslots"
  add_foreign_key "bookings", "users"
  add_foreign_key "matches", "offers"
  add_foreign_key "matches", "searches"
  add_foreign_key "offers", "users"
  add_foreign_key "searches", "users"
  add_foreign_key "statuses", "offers"
  add_foreign_key "statuses", "users"
  add_foreign_key "timeslots", "offers"
end
