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

ActiveRecord::Schema.define(version: 20140630175330) do

  create_table "clients", force: true do |t|
    t.string   "uid"
    t.string   "name"
    t.string   "vertical"
    t.string   "type"
    t.string   "domain"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "uid"
    t.string   "name"
    t.boolean  "corporate"
    t.string   "urn"
    t.string   "state"
    t.string   "city"
    t.string   "street_address"
    t.string   "postal_code"
    t.string   "domain"
    t.string   "city_slug"
    t.string   "phone_number"
    t.string   "neighborhood"
    t.string   "primary_amenity"
    t.string   "primary_landmark"
    t.string   "qualifier"
    t.string   "floor_plans"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
