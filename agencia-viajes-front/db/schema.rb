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

ActiveRecord::Schema.define(version: 20160804182518) do

  create_table "permissions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "action"
    t.string   "view"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "permissions", ["user_id"], name: "index_permissions_on_user_id"

  create_table "session_logs", force: :cascade do |t|
    t.string   "user_name"
    t.date     "logged_date"
    t.boolean  "success"
    t.string   "error_message"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "user_name"
    t.string   "email"
    t.string   "password_digest"
    t.date     "birth_date"
    t.boolean  "status",          default: true
    t.string   "phone"
    t.string   "identification"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

end
