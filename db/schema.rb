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

ActiveRecord::Schema.define(version: 20150514002749) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cat_rental_requests", force: :cascade do |t|
    t.integer  "cat_id",                 null: false
    t.datetime "start_date",             null: false
    t.datetime "end_date",               null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "status",                 null: false
    t.integer  "user_id",    default: 1, null: false
  end

  add_index "cat_rental_requests", ["cat_id"], name: "index_cat_rental_requests_on_cat_id", using: :btree

  create_table "cats", force: :cascade do |t|
    t.string   "color"
    t.string   "name",                                        null: false
    t.string   "sex",                                         null: false
    t.text     "description"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.datetime "birth_date",  default: '2010-05-13 20:09:34', null: false
    t.integer  "user_id"
  end

  add_index "cats", ["name"], name: "index_cats_on_name", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.integer  "user_id",       null: false
    t.string   "session_token", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_token"], name: "index_sessions_on_session_token", using: :btree
  add_index "sessions", ["user_id"], name: "index_sessions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "user_name",       null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["user_name"], name: "index_users_on_user_name", using: :btree

  add_foreign_key "cat_rental_requests", "cats"
end
