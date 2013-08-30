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

ActiveRecord::Schema.define(version: 20130830055455) do

  create_table "pincodes", force: true do |t|
    t.string  "office"
    t.integer "pincode"
    t.string  "office_type"
    t.string  "delivery_status"
    t.string  "division"
    t.string  "region"
    t.string  "circle"
    t.string  "taluk"
    t.string  "district"
    t.string  "state"
  end

  add_index "pincodes", ["district"], name: "index_pincodes_on_district", using: :btree
  add_index "pincodes", ["pincode"], name: "index_pincodes_on_pincode", using: :btree
  add_index "pincodes", ["state"], name: "index_pincodes_on_state", using: :btree

  create_table "pincodes_new", id: false, force: true do |t|
    t.string  "office"
    t.integer "pincode"
    t.string  "office_type"
    t.string  "delivery_status"
    t.string  "division"
    t.string  "region"
    t.string  "circle"
    t.string  "taluk"
    t.string  "district"
    t.string  "state"
  end

  add_index "pincodes_new", ["district"], name: "district_idx", using: :btree
  add_index "pincodes_new", ["pincode"], name: "pincode_idx", using: :btree
  add_index "pincodes_new", ["state"], name: "state_idx", using: :btree

end
