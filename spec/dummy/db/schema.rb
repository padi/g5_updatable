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

ActiveRecord::Schema.define(version: 20141030211945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorite_foods", force: true do |t|
    t.string   "name"
    t.string   "location_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "g5_updatable_clients", force: true do |t|
    t.string   "uid"
    t.string   "urn"
    t.json     "properties"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "g5_updatable_clients", ["uid"], name: "index_g5_updatable_clients_on_uid", using: :btree
  add_index "g5_updatable_clients", ["urn"], name: "index_g5_updatable_clients_on_urn", using: :btree

  create_table "g5_updatable_integration_settings", force: true do |t|
    t.string   "uid"
    t.string   "urn"
    t.string   "location_uid"
    t.string   "vendor_action"
    t.integer  "job_frequency_in_minutes"
    t.json     "properties"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "g5_updatable_integration_settings", ["location_uid", "vendor_action"], name: "g5_u_is_loc_action", using: :btree
  add_index "g5_updatable_integration_settings", ["uid"], name: "index_g5_updatable_integration_settings_on_uid", using: :btree
  add_index "g5_updatable_integration_settings", ["urn"], name: "index_g5_updatable_integration_settings_on_urn", using: :btree
  add_index "g5_updatable_integration_settings", ["vendor_action"], name: "index_g5_updatable_integration_settings_on_vendor_action", using: :btree

  create_table "g5_updatable_locations", force: true do |t|
    t.string   "uid"
    t.string   "urn"
    t.string   "client_uid"
    t.json     "properties"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "g5_updatable_locations", ["uid"], name: "index_g5_updatable_locations_on_uid", using: :btree
  add_index "g5_updatable_locations", ["urn"], name: "index_g5_updatable_locations_on_urn", using: :btree

end
