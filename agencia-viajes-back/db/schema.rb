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

ActiveRecord::Schema.define(version: 20160803211631) do

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "identification"
    t.string   "email"
    t.date     "birth_date"
    t.string   "phone"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "destinations", force: :cascade do |t|
    t.string   "city"
    t.string   "country"
    t.integer  "price",      default: 0
    t.integer  "taxes",      default: 0
    t.integer  "total",      default: 0
    t.boolean  "status",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "destination_id"
    t.integer  "quantity",       default: 1
    t.integer  "total",          default: 0
    t.date     "sale_date"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "sales", ["customer_id"], name: "index_sales_on_customer_id"
  add_index "sales", ["destination_id"], name: "index_sales_on_destination_id"

  create_table "tokens", force: :cascade do |t|
    t.string   "token"
    t.integer  "number_of_request", default: 0
    t.boolean  "status",            default: true
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

end
