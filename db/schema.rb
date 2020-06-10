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

ActiveRecord::Schema.define(version: 2020_06_10_153749) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "cleaner_id", null: false
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cleaner_id"], name: "index_bookings_on_cleaner_id"
    t.index ["customer_id"], name: "index_bookings_on_customer_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cleaners", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.float "quolity_scope", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "employed", default: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["phone_number"], name: "index_customers_on_phone_number", unique: true
  end

  create_table "workplaces", force: :cascade do |t|
    t.integer "cleaner_id"
    t.integer "city_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_workplaces_on_city_id"
    t.index ["cleaner_id"], name: "index_workplaces_on_cleaner_id"
  end

  add_foreign_key "bookings", "cleaners"
  add_foreign_key "bookings", "customers"
end
