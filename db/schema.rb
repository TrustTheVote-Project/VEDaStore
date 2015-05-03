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

ActiveRecord::Schema.define(version: 20150503012731) do

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

  create_table "election_report_uploads", force: :cascade do |t|
    t.integer  "election_report_id"
    t.integer  "jurisdiction_id"
    t.string   "file_name"
    t.string   "source_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "jurisdictions", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.text     "contact_info"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "state_id"
  end

  add_index "jurisdictions", ["state_id"], name: "index_jurisdictions_on_state_id"

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

  create_table "states", force: :cascade do |t|
    t.string   "abbreviation"
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "vssc_ballot_selections", force: :cascade do |t|
    t.string   "object_id"
    t.string   "ballot_selection_id"
    t.string   "type"
    t.string   "selection"
    t.boolean  "is_write_in"
    t.string   "abbreviation"
    t.string   "local_party_code"
    t.string   "name"
    t.string   "national_party_code"
    t.string   "state_party_code"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "vssc_ballot_selections", ["object_id"], name: "index_vssc_ballot_selections_on_object_id"

  create_table "vssc_ballot_selections_contests", id: false, force: :cascade do |t|
    t.integer "ballot_selection_id"
    t.integer "contest_id"
  end

  add_index "vssc_ballot_selections_contests", ["ballot_selection_id"], name: "index_vssc_ballot_selections_contests_on_ballot_selection_id"
  add_index "vssc_ballot_selections_contests", ["contest_id"], name: "index_vssc_ballot_selections_contests_on_contest_id"

  create_table "vssc_ballot_selections_counts", id: false, force: :cascade do |t|
    t.integer "ballot_selection_id"
    t.integer "vote_count_id"
  end

  add_index "vssc_ballot_selections_counts", ["ballot_selection_id"], name: "index_vssc_ballot_selections_counts_on_ballot_selection_id"
  add_index "vssc_ballot_selections_counts", ["vote_count_id"], name: "index_vssc_ballot_selections_counts_on_vote_count_id"

  create_table "vssc_ballot_selections_election_reports", id: false, force: :cascade do |t|
    t.integer "election_report_id"
    t.integer "party_id"
  end

  add_index "vssc_ballot_selections_election_reports", ["election_report_id"], name: "bser_election_report_id"
  add_index "vssc_ballot_selections_election_reports", ["party_id"], name: "bser_party_id"

  create_table "vssc_ballot_styles", force: :cascade do |t|
    t.string   "object_id"
    t.string   "ballot_style_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "gp_unit_id"
  end

  add_index "vssc_ballot_styles", ["gp_unit_id"], name: "index_vssc_ballot_styles_on_gp_unit_id"
  add_index "vssc_ballot_styles", ["object_id"], name: "index_vssc_ballot_styles_on_object_id"

  create_table "vssc_ballot_styles_elections", id: false, force: :cascade do |t|
    t.integer "election_id"
    t.integer "ballot_style_id"
  end

  add_index "vssc_ballot_styles_elections", ["ballot_style_id"], name: "index_vssc_ballot_styles_elections_on_ballot_style_id"
  add_index "vssc_ballot_styles_elections", ["election_id"], name: "index_vssc_ballot_styles_elections_on_election_id"

  create_table "vssc_ballot_styles_ordered_contests", id: false, force: :cascade do |t|
    t.integer "ballot_style_id"
    t.integer "ordered_contest_id"
  end

  add_index "vssc_ballot_styles_ordered_contests", ["ballot_style_id"], name: "bsoc_ballot_style_id"
  add_index "vssc_ballot_styles_ordered_contests", ["ordered_contest_id"], name: "bsoc_ordered_contest_id"

  create_table "vssc_candidate_office_refs", force: :cascade do |t|
    t.string   "object_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "candidate_id"
  end

  add_index "vssc_candidate_office_refs", ["candidate_id"], name: "index_vssc_candidate_office_refs_on_candidate_id"
  add_index "vssc_candidate_office_refs", ["object_id"], name: "index_vssc_candidate_office_refs_on_object_id"

  create_table "vssc_candidate_selection_candidate_refs", force: :cascade do |t|
    t.string   "object_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "candidate_selection_id"
  end

  add_index "vssc_candidate_selection_candidate_refs", ["candidate_selection_id"], name: "cscr_candidate_selection_id"
  add_index "vssc_candidate_selection_candidate_refs", ["object_id"], name: "cscr_object_id"

  create_table "vssc_candidate_selection_party_refs", force: :cascade do |t|
    t.string   "object_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "candidate_selection_id"
  end

  add_index "vssc_candidate_selection_party_refs", ["candidate_selection_id"], name: "cspr_candidate_selection_id"
  add_index "vssc_candidate_selection_party_refs", ["object_id"], name: "cspr_object_id"

  create_table "vssc_candidates", force: :cascade do |t|
    t.string   "object_id"
    t.string   "ballot_name"
    t.string   "candidate_id"
    t.string   "party"
    t.string   "person"
    t.datetime "file_date"
    t.boolean  "is_incumbent"
    t.boolean  "is_top_ticket"
    t.integer  "sequence_order"
    t.string   "status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "person_id"
  end

  add_index "vssc_candidates", ["object_id"], name: "index_vssc_candidates_on_object_id"
  add_index "vssc_candidates", ["person_id"], name: "index_vssc_candidates_on_person_id"

  create_table "vssc_candidates_elections", id: false, force: :cascade do |t|
    t.integer "election_id"
    t.integer "candidate_id"
  end

  add_index "vssc_candidates_elections", ["candidate_id"], name: "index_vssc_candidates_elections_on_candidate_id"
  add_index "vssc_candidates_elections", ["election_id"], name: "index_vssc_candidates_elections_on_election_id"

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

  add_index "vssc_contacts", ["object_id"], name: "index_vssc_contacts_on_object_id"

  create_table "vssc_contacts_gp_units", id: false, force: :cascade do |t|
    t.integer "contact_id"
    t.integer "reporting_unit_id"
  end

  add_index "vssc_contacts_gp_units", ["contact_id"], name: "index_vssc_contacts_gp_units_on_contact_id"
  add_index "vssc_contacts_gp_units", ["reporting_unit_id"], name: "index_vssc_contacts_gp_units_on_reporting_unit_id"

  create_table "vssc_contacts_people", id: false, force: :cascade do |t|
    t.integer "contact_id"
    t.integer "person_id"
  end

  add_index "vssc_contacts_people", ["contact_id"], name: "index_vssc_contacts_people_on_contact_id"
  add_index "vssc_contacts_people", ["person_id"], name: "index_vssc_contacts_people_on_person_id"

  create_table "vssc_contest_total_counts", force: :cascade do |t|
    t.integer  "contest_id"
    t.integer  "total_count_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "vssc_contest_total_counts", ["contest_id"], name: "index_vssc_contest_total_counts_on_contest_id"
  add_index "vssc_contest_total_counts", ["total_count_id"], name: "index_vssc_contest_total_counts_on_total_count_id"

  create_table "vssc_contest_total_counts_by_gp_units", force: :cascade do |t|
    t.integer  "contest_id"
    t.integer  "total_count_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "vssc_contest_total_counts_by_gp_units", ["contest_id"], name: "index_vssc_contest_total_counts_by_gp_units_on_contest_id"
  add_index "vssc_contest_total_counts_by_gp_units", ["total_count_id"], name: "index_vssc_contest_total_counts_by_gp_units_on_total_count_id"

  create_table "vssc_contests", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.string   "object_id"
    t.string   "contest_gp_scope"
    t.string   "abbreviation"
    t.string   "local_contest_code"
    t.string   "national_contest_code"
    t.string   "state_contest_code"
    t.integer  "reported_precincts"
    t.integer  "sequence_order"
    t.integer  "total_precincts"
    t.string   "office"
    t.string   "primary_party"
    t.integer  "number_elected"
    t.integer  "votes_allowed"
    t.string   "vote_variation"
    t.text     "full_text"
    t.text     "summary_text"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "vssc_contests", ["object_id"], name: "index_vssc_contests_on_object_id"

  create_table "vssc_contests_elections", id: false, force: :cascade do |t|
    t.integer "election_id"
    t.integer "contest_id"
  end

  add_index "vssc_contests_elections", ["contest_id"], name: "index_vssc_contests_elections_on_contest_id"
  add_index "vssc_contests_elections", ["election_id"], name: "index_vssc_contests_elections_on_election_id"

  create_table "vssc_counts", force: :cascade do |t|
    t.string   "type"
    t.string   "gp_unit"
    t.string   "object_id"
    t.string   "ballot_type"
    t.string   "device_manufacturer"
    t.string   "device_model"
    t.string   "device_type"
    t.integer  "ballots_cast"
    t.integer  "overvotes"
    t.integer  "undervotes"
    t.integer  "write_ins"
    t.float    "count"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "vssc_counts", ["object_id"], name: "index_vssc_counts_on_object_id"

  create_table "vssc_counts_gp_units", id: false, force: :cascade do |t|
    t.integer "gp_unit_id"
    t.integer "total_count_id"
  end

  add_index "vssc_counts_gp_units", ["gp_unit_id"], name: "index_vssc_counts_gp_units_on_gp_unit_id"
  add_index "vssc_counts_gp_units", ["total_count_id"], name: "index_vssc_counts_gp_units_on_total_count_id"

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

  add_index "vssc_election_reports", ["object_id"], name: "index_vssc_election_reports_on_object_id"

  create_table "vssc_election_reports_gp_units", id: false, force: :cascade do |t|
    t.integer "election_report_id"
    t.integer "gp_unit_id"
  end

  add_index "vssc_election_reports_gp_units", ["election_report_id"], name: "index_vssc_election_reports_gp_units_on_election_report_id"
  add_index "vssc_election_reports_gp_units", ["gp_unit_id"], name: "index_vssc_election_reports_gp_units_on_gp_unit_id"

  create_table "vssc_election_reports_offices", id: false, force: :cascade do |t|
    t.integer "election_report_id"
    t.integer "office_id"
  end

  add_index "vssc_election_reports_offices", ["election_report_id"], name: "index_vssc_election_reports_offices_on_election_report_id"
  add_index "vssc_election_reports_offices", ["office_id"], name: "index_vssc_election_reports_offices_on_office_id"

  create_table "vssc_election_reports_people", id: false, force: :cascade do |t|
    t.integer "election_report_id"
    t.integer "person_id"
  end

  add_index "vssc_election_reports_people", ["election_report_id"], name: "index_vssc_election_reports_people_on_election_report_id"
  add_index "vssc_election_reports_people", ["person_id"], name: "index_vssc_election_reports_people_on_person_id"

  create_table "vssc_elections", force: :cascade do |t|
    t.string   "object_id"
    t.string   "name"
    t.string   "election_type"
    t.string   "election_gp_scope"
    t.date     "date"
    t.string   "url"
    t.string   "absentee_count_status"
    t.string   "early_count_status"
    t.string   "election_day_count_status"
    t.string   "provisional_count_status"
    t.string   "write_in_count_status"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "election_report_id"
  end

  add_index "vssc_elections", ["election_report_id"], name: "index_vssc_elections_on_election_report_id"
  add_index "vssc_elections", ["object_id"], name: "index_vssc_elections_on_object_id"

  create_table "vssc_gp_sub_unit_refs", force: :cascade do |t|
    t.string   "object_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "gp_unit_id"
  end

  add_index "vssc_gp_sub_unit_refs", ["gp_unit_id"], name: "index_vssc_gp_sub_unit_refs_on_gp_unit_id"
  add_index "vssc_gp_sub_unit_refs", ["object_id"], name: "index_vssc_gp_sub_unit_refs_on_object_id"

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
    t.string   "reporting_unit_type"
    t.integer  "total_participating_voters"
    t.integer  "total_precincts"
    t.string   "device_type"
    t.string   "manufacturer"
    t.string   "serial_number"
    t.string   "district_type"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "party_registration_id"
    t.integer  "gp_unit_id"
  end

  add_index "vssc_gp_units", ["gp_unit_id"], name: "index_vssc_gp_units_on_gp_unit_id"
  add_index "vssc_gp_units", ["object_id"], name: "index_vssc_gp_units_on_object_id"
  add_index "vssc_gp_units", ["party_registration_id"], name: "index_vssc_gp_units_on_party_registration_id"

  create_table "vssc_gp_units_spatial_dimensions", id: false, force: :cascade do |t|
    t.integer "gp_unit_id"
    t.integer "spatial_dimension_id"
  end

  add_index "vssc_gp_units_spatial_dimensions", ["gp_unit_id"], name: "index_vssc_gp_units_spatial_dimensions_on_gp_unit_id"
  add_index "vssc_gp_units_spatial_dimensions", ["spatial_dimension_id"], name: "index_vssc_gp_units_spatial_dimensions_on_spatial_dimension_id"

  create_table "vssc_offices", force: :cascade do |t|
    t.string   "object_id"
    t.string   "name"
    t.string   "office_gp_scope"
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
  end

  add_index "vssc_offices", ["object_id"], name: "index_vssc_offices_on_object_id"

  create_table "vssc_ordered_contest_ballot_selection_refs", force: :cascade do |t|
    t.string   "object_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "ordered_contest_id"
  end

  add_index "vssc_ordered_contest_ballot_selection_refs", ["object_id"], name: "ocbsr_object_id"
  add_index "vssc_ordered_contest_ballot_selection_refs", ["ordered_contest_id"], name: "ocbsr_ordered_contest_id"

  create_table "vssc_ordered_contests", force: :cascade do |t|
    t.string   "object_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "contest_id"
  end

  add_index "vssc_ordered_contests", ["contest_id"], name: "index_vssc_ordered_contests_on_contest_id"
  add_index "vssc_ordered_contests", ["object_id"], name: "index_vssc_ordered_contests_on_object_id"

  create_table "vssc_parties", force: :cascade do |t|
    t.string   "object_id"
    t.string   "abbreviation"
    t.string   "local_party_code"
    t.string   "name"
    t.string   "national_party_code"
    t.string   "state_party_code"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "vssc_parties", ["object_id"], name: "index_vssc_parties_on_object_id"

  create_table "vssc_party_registrations", force: :cascade do |t|
    t.string   "object_id"
    t.string   "party"
    t.integer  "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "vssc_party_registrations", ["object_id"], name: "index_vssc_party_registrations_on_object_id"

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
    t.string   "party"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "vssc_people", ["object_id"], name: "index_vssc_people_on_object_id"

  create_table "vssc_reporting_unit_authority_refs", force: :cascade do |t|
    t.string   "object_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "gp_unit_id"
  end

  add_index "vssc_reporting_unit_authority_refs", ["gp_unit_id"], name: "ruar_reporting_unit_id"
  add_index "vssc_reporting_unit_authority_refs", ["object_id"], name: "ruar_object_id"

  create_table "vssc_spatial_dimensions", force: :cascade do |t|
    t.string   "object_id"
    t.text     "map"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "spatial_extent_id"
  end

  add_index "vssc_spatial_dimensions", ["object_id"], name: "index_vssc_spatial_dimensions_on_object_id"
  add_index "vssc_spatial_dimensions", ["spatial_extent_id"], name: "index_vssc_spatial_dimensions_on_spatial_extent_id"

  create_table "vssc_spatial_extents", force: :cascade do |t|
    t.string   "object_id"
    t.string   "format"
    t.text     "coordinates"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "spatial_dimension_id"
  end

  add_index "vssc_spatial_extents", ["object_id"], name: "index_vssc_spatial_extents_on_object_id"
  add_index "vssc_spatial_extents", ["spatial_dimension_id"], name: "index_vssc_spatial_extents_on_spatial_dimension_id"

end
