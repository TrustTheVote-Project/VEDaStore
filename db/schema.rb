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

ActiveRecord::Schema.define(version: 20150415200208) do

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

  create_table "vssc_ballot_selections", force: :cascade do |t|
    t.string   "object_id"
    t.string   "ballot_selection_id"
    t.string   "type"
    t.string   "abbreviation"
    t.string   "localPartyCode"
    t.string   "name"
    t.string   "nationalPartyCode"
    t.string   "statePartyCode"
    t.string   "selection"
    t.boolean  "is_write_in"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "vssc_ballot_styles", force: :cascade do |t|
    t.string   "object_id"
    t.string   "ballot_style_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "vssc_gp_unit_id"
  end

  add_index "vssc_ballot_styles", ["vssc_gp_unit_id"], name: "index_vssc_ballot_styles_on_vssc_gp_unit_id"

  create_table "vssc_candidates", force: :cascade do |t|
    t.string   "object_id"
    t.string   "ballot_name"
    t.string   "candidate_id"
    t.datetime "file_date"
    t.boolean  "is_incumbent"
    t.boolean  "is_top_ticket"
    t.integer  "sequence_order"
    t.string   "status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "vssc_party_id"
    t.integer  "vssc_person_id"
  end

  add_index "vssc_candidates", ["vssc_party_id"], name: "index_vssc_candidates_on_vssc_party_id"
  add_index "vssc_candidates", ["vssc_person_id"], name: "index_vssc_candidates_on_vssc_person_id"

  create_table "vssc_contacts", force: :cascade do |t|
    t.string   "object_id"
    t.string   "name"
    t.string   "url"
    t.string   "address_number"
    t.string   "street_name"
    t.string   "city"
    t.string   "state_abbreviation"
    t.string   "postal_code"
    t.string   "country"
    t.string   "email"
    t.string   "fax"
    t.string   "phone"
    t.string   "hours"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "vssc_contests", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.string   "object_id"
    t.string   "abbreviation"
    t.string   "local_contest_code"
    t.string   "national_contest_code"
    t.string   "state_contest_code"
    t.integer  "reported_precincts"
    t.integer  "sequence_order"
    t.integer  "total_precincts"
    t.integer  "number_elected"
    t.integer  "votes_allowed"
    t.integer  "vote_variation_id"
    t.text     "full_text"
    t.text     "summary_text"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "vssc_contests", ["vote_variation_id"], name: "index_vssc_contests_on_vote_variation_id"

  create_table "vssc_counts", force: :cascade do |t|
    t.string   "type"
    t.string   "object_id"
    t.integer  "ballot_type_id"
    t.string   "device_manufacturer"
    t.string   "device_model"
    t.integer  "device_type_id"
    t.integer  "ballots_cast"
    t.integer  "overvotes"
    t.integer  "undervotes"
    t.integer  "write_ins"
    t.float    "count"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "vssc_election_reports", force: :cascade do |t|
    t.text     "message"
    t.string   "object_id"
    t.datetime "date"
    t.string   "format"
    t.string   "status"
    t.string   "issuer"
    t.integer  "sequence"
    t.integer  "sequence_end"
    t.string   "state_abbreviation"
    t.string   "state_code"
    t.string   "vendor_application_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "vssc_elections", force: :cascade do |t|
    t.string   "object_id"
    t.string   "name"
    t.string   "type"
    t.date     "date"
    t.string   "url"
    t.string   "absentee_count_status"
    t.string   "early_count_status"
    t.string   "election_day_count_status"
    t.string   "provisional_count_status"
    t.string   "write_in_count_status"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "vssc_gp_unit_id"
  end

  add_index "vssc_elections", ["vssc_gp_unit_id"], name: "index_vssc_elections_on_vssc_gp_unit_id"

  create_table "vssc_gp_units", force: :cascade do |t|
    t.string   "type"
    t.string   "object_id"
    t.string   "url"
    t.string   "local_geo_code"
    t.string   "name"
    t.string   "national_geo_code"
    t.string   "state_geo_code"
    t.boolean  "has_reported"
    t.integer  "registered_voters"
    t.integer  "reported_precincts"
    t.integer  "reporting_unit_type_id"
    t.integer  "total_participating_voters"
    t.integer  "total_precincts"
    t.integer  "device_type_id"
    t.string   "manufacturer"
    t.string   "serial_number"
    t.integer  "district_type_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "vssc_offices", force: :cascade do |t|
    t.string   "object_id"
    t.string   "name"
    t.datetime "filing_date"
    t.boolean  "incumbent_running"
    t.string   "local_office_code"
    t.string   "national_office_code"
    t.string   "state_office_code"
    t.boolean  "partisan"
    t.date     "term_start_date"
    t.date     "term_end_date"
    t.boolean  "unexpired_term"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "vssc_gp_unit_id"
  end

  add_index "vssc_offices", ["vssc_gp_unit_id"], name: "index_vssc_offices_on_vssc_gp_unit_id"

  create_table "vssc_ordered_contests", force: :cascade do |t|
    t.string   "object_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "vssc_contest_id"
  end

  add_index "vssc_ordered_contests", ["vssc_contest_id"], name: "index_vssc_ordered_contests_on_vssc_contest_id"

  create_table "vssc_parties", force: :cascade do |t|
    t.string   "abbreviation"
    t.string   "local_party_code"
    t.string   "name"
    t.string   "national_party_code"
    t.string   "state_party_code"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "vssc_party_registrations", force: :cascade do |t|
    t.string   "object_id"
    t.integer  "count"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "vssc_party_id"
  end

  add_index "vssc_party_registrations", ["vssc_party_id"], name: "index_vssc_party_registrations_on_vssc_party_id"

  create_table "vssc_people", force: :cascade do |t|
    t.string   "object_id"
    t.string   "ethnicity"
    t.string   "gender"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "prefix"
    t.string   "suffix"
    t.string   "title"
    t.string   "profession"
    t.string   "nickname"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "vssc_party_id"
  end

  add_index "vssc_people", ["vssc_party_id"], name: "index_vssc_people_on_vssc_party_id"

  create_table "vssc_spatial_dimensions", force: :cascade do |t|
    t.string   "object_id"
    t.text     "map"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "vssc_spatial_extent_id"
  end

  add_index "vssc_spatial_dimensions", ["vssc_spatial_extent_id"], name: "index_vssc_spatial_dimensions_on_vssc_spatial_extent_id"

  create_table "vssc_spatial_extents", force: :cascade do |t|
    t.string   "object_id"
    t.string   "format"
    t.text     "coordinates"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
