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

ActiveRecord::Schema.define(version: 20150411191939) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "district_id"
    t.integer  "apartment_id"
    t.string   "street"
    t.string   "postcode"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "addresses", ["apartment_id"], name: "index_addresses_on_apartment_id", using: :btree
  add_index "addresses", ["district_id"], name: "index_addresses_on_district_id", using: :btree

  create_table "apartments", force: :cascade do |t|
    t.integer  "landlord_id"
    t.text     "discription"
    t.integer  "public_room_amount"
    t.integer  "balcony_amount"
    t.boolean  "kitchen"
    t.integer  "type"
    t.string   "address_details"
    t.float    "area_size"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "apartments", ["landlord_id"], name: "index_apartments_on_landlord_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "districts", ["city_id"], name: "index_districts_on_city_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.integer  "rent_case_id"
    t.integer  "organizer_id"
    t.integer  "group_size"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "name"
    t.text     "discription"
  end

  add_index "groups", ["organizer_id"], name: "index_groups_on_organizer_id", using: :btree
  add_index "groups", ["rent_case_id"], name: "index_groups_on_rent_case_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "nickname"
    t.integer  "gender"
    t.datetime "birthdate"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "rent_cases", force: :cascade do |t|
    t.integer  "apartment_id"
    t.integer  "owner_id"
    t.integer  "price"
    t.datetime "move_in_date"
    t.text     "discription"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "state"
    t.string   "type",         limit: 25
  end

  add_index "rent_cases", ["apartment_id"], name: "index_rent_cases_on_apartment_id", using: :btree
  add_index "rent_cases", ["owner_id"], name: "index_rent_cases_on_owner_id", using: :btree

  create_table "user_group_ships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.string   "state",      default: "0"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "message"
  end

  add_index "user_group_ships", ["group_id"], name: "index_user_group_ships_on_group_id", using: :btree
  add_index "user_group_ships", ["user_id"], name: "index_user_group_ships_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "username",               default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
