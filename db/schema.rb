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

ActiveRecord::Schema.define(version: 20150331141136) do

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.string   "internal_id"
    t.string   "district_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "ocd_object_id"
    t.integer  "jurisdiction_id"
  end

  add_index "districts", ["jurisdiction_id"], name: "index_districts_on_jurisdiction_id"
  add_index "districts", ["ocd_object_id"], name: "index_districts_on_ocd_object_id"

  create_table "districts_reporting_units", id: false, force: :cascade do |t|
    t.integer "reporting_unit_id", null: false
    t.integer "district_id",       null: false
  end

  add_index "districts_reporting_units", ["district_id"], name: "index_districts_reporting_units_on_district_id"
  add_index "districts_reporting_units", ["reporting_unit_id"], name: "index_districts_reporting_units_on_reporting_unit_id"

  create_table "jurisdictions", force: :cascade do |t|
    t.string   "name"
    t.text     "contact_info"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "ocd_objects", force: :cascade do |t|
    t.string   "name"
    t.string   "unit_type"
    t.string   "district_type"
    t.string   "ocd_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "ocd_object_id"
  end

  add_index "ocd_objects", ["ocd_id"], name: "index_ocd_objects_on_ocd_id"
  add_index "ocd_objects", ["ocd_object_id"], name: "index_ocd_objects_on_ocd_object_id"

  create_table "reporting_units", force: :cascade do |t|
    t.string   "name"
    t.string   "internal_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "ocd_object_id"
    t.integer  "jurisdiction_id"
  end

  add_index "reporting_units", ["jurisdiction_id"], name: "index_reporting_units_on_jurisdiction_id"
  add_index "reporting_units", ["ocd_object_id"], name: "index_reporting_units_on_ocd_object_id"

  create_table "shape_sources", force: :cascade do |t|
    t.string   "name"
    t.text     "contact_info"
    t.text     "source_data"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "shapes", force: :cascade do |t|
    t.string   "internal_id"
    t.text     "shape_data"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "ocd_object_id"
    t.integer  "shape_source_id"
  end

  add_index "shapes", ["ocd_object_id"], name: "index_shapes_on_ocd_object_id"
  add_index "shapes", ["shape_source_id"], name: "index_shapes_on_shape_source_id"

end
