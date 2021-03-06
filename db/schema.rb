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

ActiveRecord::Schema.define(version: 20171025202923) do

  create_table "availabilities", force: :cascade do |t|
    t.string   "available_time"
    t.integer  "restaurant_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "restaurant_id", null: false
    t.datetime "reserved_time", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "address",      null: false
    t.string   "neighborhood", null: false
    t.string   "price_range",  null: false
    t.string   "menu",         null: false
    t.text     "summary",      null: false
    t.string   "time_slots"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
