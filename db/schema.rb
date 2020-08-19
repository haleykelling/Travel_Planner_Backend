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

ActiveRecord::Schema.define(version: 2020_08_19_194353) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accomodations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "reservation_number"
    t.string "phone_number"
  end

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.text "details"
    t.string "type_of_activity", default: "General"
    t.string "address"
    t.integer "start_time"
    t.integer "end_time"
    t.bigint "day_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["day_id"], name: "index_activities_on_day_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "text"
    t.bigint "day_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["day_id"], name: "index_comments_on_day_id"
  end

  create_table "day_accomodations", force: :cascade do |t|
    t.bigint "day_id", null: false
    t.bigint "accomodation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["accomodation_id"], name: "index_day_accomodations_on_accomodation_id"
    t.index ["day_id"], name: "index_day_accomodations_on_day_id"
  end

  create_table "day_transportations", force: :cascade do |t|
    t.bigint "day_id", null: false
    t.bigint "transportation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["day_id"], name: "index_day_transportations_on_day_id"
    t.index ["transportation_id"], name: "index_day_transportations_on_transportation_id"
  end

  create_table "days", force: :cascade do |t|
    t.date "date"
    t.string "start_city"
    t.string "end_city"
    t.bigint "trip_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "start_latitude"
    t.float "start_longitude"
    t.float "end_latitude"
    t.float "end_longitude"
    t.index ["trip_id"], name: "index_days_on_trip_id"
  end

  create_table "transportations", force: :cascade do |t|
    t.string "name"
    t.string "details"
    t.string "type_of_activity"
    t.string "address"
    t.integer "start_time"
    t.integer "end_time"
    t.boolean "multiday"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "activities", "days"
  add_foreign_key "comments", "days"
  add_foreign_key "day_accomodations", "accomodations"
  add_foreign_key "day_accomodations", "days"
  add_foreign_key "day_transportations", "days"
  add_foreign_key "day_transportations", "transportations"
  add_foreign_key "days", "trips"
  add_foreign_key "trips", "users"
end
