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

ActiveRecord::Schema.define(version: 20150303090552) do

  create_table "apartments", force: :cascade do |t|
    t.integer  "city_id",            limit: 4
    t.integer  "district_id",        limit: 4
    t.integer  "landlord_id",        limit: 4
    t.text     "discription",        limit: 65535
    t.integer  "personal_amount",    limit: 4
    t.integer  "public_room_amount", limit: 4
    t.integer  "balcony_amount",     limit: 4
    t.boolean  "kitchen",            limit: 1
    t.integer  "type",               limit: 4
    t.string   "address_details",    limit: 255
    t.float    "area_size",          limit: 24
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "apartments", ["city_id"], name: "index_apartments_on_city_id", using: :btree
  add_index "apartments", ["district_id"], name: "index_apartments_on_district_id", using: :btree
  add_index "apartments", ["landlord_id"], name: "index_apartments_on_landlord_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.integer  "rent_case_id", limit: 4
    t.integer  "organizer_id", limit: 4
    t.integer  "group_size",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "groups", ["organizer_id"], name: "index_groups_on_organizer_id", using: :btree
  add_index "groups", ["rent_case_id"], name: "index_groups_on_rent_case_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "nickname",   limit: 255
    t.integer  "gender",     limit: 4
    t.datetime "birthdate"
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "rent_cases", force: :cascade do |t|
    t.integer  "apartment_id", limit: 4
    t.integer  "owner_id",     limit: 4
    t.integer  "price",        limit: 4
    t.datetime "move_in_date"
    t.text     "discription",  limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "state",        limit: 255
    t.string   "type",         limit: 25
  end

  add_index "rent_cases", ["apartment_id"], name: "index_rent_cases_on_apartment_id", using: :btree
  add_index "rent_cases", ["owner_id"], name: "index_rent_cases_on_owner_id", using: :btree

  create_table "user_group_ships", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "group_id",   limit: 4
    t.integer  "status",     limit: 4, default: 0
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "user_group_ships", ["group_id"], name: "index_user_group_ships_on_group_id", using: :btree
  add_index "user_group_ships", ["user_id"], name: "index_user_group_ships_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "username",               limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
