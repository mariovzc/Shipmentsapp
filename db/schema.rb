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

ActiveRecord::Schema.define(version: 9) do

  create_table "buses", force: :cascade do |t|
    t.string   "license_plate"
    t.integer  "fleet_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["fleet_id"], name: "index_buses_on_fleet_id"
  end

  create_table "cities", primary_key: "code", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fleets", force: :cascade do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_fleets_on_city_id"
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "order_status_id"
    t.integer  "bus_id"
    t.string   "trackingid"
    t.decimal  "latitude",        precision: 10, scale: 6
    t.decimal  "longitude",       precision: 10, scale: 6
    t.text     "description"
    t.integer  "origin_id"
    t.integer  "destination_id"
    t.decimal  "weight"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.text     "address"
    t.index ["bus_id"], name: "index_packages_on_bus_id"
    t.index ["destination_id"], name: "index_packages_on_destination_id"
    t.index ["order_status_id"], name: "index_packages_on_order_status_id"
    t.index ["origin_id"], name: "index_packages_on_origin_id"
    t.index ["user_id"], name: "index_packages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document"
    t.integer  "role"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
