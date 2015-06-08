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

ActiveRecord::Schema.define(version: 20150608204754) do

  create_table "background_sources", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "jurisdiction_id", limit: 4
  end

  add_index "background_sources", ["jurisdiction_id"], name: "index_background_sources_on_jurisdiction_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "districts", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.string   "internal_id",          limit: 255
    t.string   "district_type",        limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "ocd_object_id",        limit: 4
    t.integer  "jurisdiction_id",      limit: 4
    t.integer  "background_source_id", limit: 4
  end

  add_index "districts", ["background_source_id"], name: "index_districts_on_background_source_id", using: :btree
  add_index "districts", ["jurisdiction_id"], name: "index_districts_on_jurisdiction_id", using: :btree
  add_index "districts", ["ocd_object_id"], name: "index_districts_on_ocd_object_id", using: :btree

  create_table "districts_reporting_units", id: false, force: :cascade do |t|
    t.integer "reporting_unit_id", limit: 4, null: false
    t.integer "district_id",       limit: 4, null: false
  end

  add_index "districts_reporting_units", ["district_id"], name: "index_districts_reporting_units_on_district_id", using: :btree
  add_index "districts_reporting_units", ["reporting_unit_id"], name: "index_districts_reporting_units_on_reporting_unit_id", using: :btree

  create_table "election_report_uploads", force: :cascade do |t|
    t.integer  "election_report_id",   limit: 4
    t.integer  "jurisdiction_id",      limit: 4
    t.string   "file_name",            limit: 255
    t.string   "source_type",          limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "background_source_id", limit: 4
  end

  create_table "election_result_uploads", force: :cascade do |t|
    t.integer  "election_report_id", limit: 4
    t.integer  "row_count",          limit: 4
    t.integer  "rows_processed",     limit: 4
    t.string   "file_name",          limit: 255
    t.string   "source_type",        limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "jurisdictions", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "abbreviation", limit: 255
    t.text     "contact_info", limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "state_id",     limit: 4
  end

  add_index "jurisdictions", ["state_id"], name: "index_jurisdictions_on_state_id", using: :btree

  create_table "ocd_objects", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "unit_type",     limit: 255
    t.string   "district_type", limit: 255
    t.string   "ocd_id",        limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "ocd_object_id", limit: 4
  end

  add_index "ocd_objects", ["ocd_id"], name: "index_ocd_objects_on_ocd_id", using: :btree
  add_index "ocd_objects", ["ocd_object_id"], name: "index_ocd_objects_on_ocd_object_id", using: :btree

  create_table "reporting_units", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.string   "internal_id",          limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "ocd_object_id",        limit: 4
    t.integer  "jurisdiction_id",      limit: 4
    t.integer  "background_source_id", limit: 4
  end

  add_index "reporting_units", ["background_source_id"], name: "index_reporting_units_on_background_source_id", using: :btree
  add_index "reporting_units", ["jurisdiction_id"], name: "index_reporting_units_on_jurisdiction_id", using: :btree
  add_index "reporting_units", ["ocd_object_id"], name: "index_reporting_units_on_ocd_object_id", using: :btree

  create_table "shape_sources", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.text     "contact_info",         limit: 65535
    t.text     "source_data",          limit: 65535
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "background_source_id", limit: 4
  end

  add_index "shape_sources", ["background_source_id"], name: "index_shape_sources_on_background_source_id", using: :btree

  create_table "shapes", force: :cascade do |t|
    t.string   "internal_id",     limit: 255
    t.binary   "shape_data",      limit: 16777215
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "ocd_object_id",   limit: 4
    t.integer  "shape_source_id", limit: 4
    t.string   "shape_type",      limit: 255
  end

  add_index "shapes", ["ocd_object_id"], name: "index_shapes_on_ocd_object_id", using: :btree
  add_index "shapes", ["shape_source_id"], name: "index_shapes_on_shape_source_id", using: :btree

  create_table "states", force: :cascade do |t|
    t.string   "abbreviation", limit: 255
    t.string   "name",         limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "vssc_ballot_selections", force: :cascade do |t|
    t.string   "object_id",           limit: 255
    t.string   "ballot_selection_id", limit: 255
    t.string   "type",                limit: 255
    t.string   "selection",           limit: 255
    t.boolean  "is_write_in",         limit: 1
    t.string   "abbreviation",        limit: 255
    t.string   "local_party_code",    limit: 255
    t.string   "name",                limit: 255
    t.string   "national_party_code", limit: 255
    t.string   "state_party_code",    limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "contest_id",          limit: 4
  end

  add_index "vssc_ballot_selections", ["contest_id"], name: "index_vssc_ballot_selections_on_contest_id", using: :btree
  add_index "vssc_ballot_selections", ["object_id"], name: "index_vssc_ballot_selections_on_object_id", using: :btree

  create_table "vssc_ballot_selections_counts", id: false, force: :cascade do |t|
    t.integer "ballot_selection_id", limit: 4
    t.integer "vote_count_id",       limit: 4
  end

  add_index "vssc_ballot_selections_counts", ["ballot_selection_id"], name: "index_vssc_ballot_selections_counts_on_ballot_selection_id", using: :btree
  add_index "vssc_ballot_selections_counts", ["vote_count_id"], name: "index_vssc_ballot_selections_counts_on_vote_count_id", using: :btree

  create_table "vssc_ballot_selections_election_reports", id: false, force: :cascade do |t|
    t.integer "election_report_id", limit: 4
    t.integer "party_id",           limit: 4
  end

  add_index "vssc_ballot_selections_election_reports", ["election_report_id"], name: "bser_election_report_id", using: :btree
  add_index "vssc_ballot_selections_election_reports", ["party_id"], name: "bser_party_id", using: :btree

  create_table "vssc_ballot_styles", force: :cascade do |t|
    t.string   "object_id",       limit: 255
    t.string   "ballot_style_id", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "gp_unit_id",      limit: 4
    t.integer  "election_id",     limit: 4
  end

  add_index "vssc_ballot_styles", ["election_id"], name: "index_vssc_ballot_styles_on_election_id", using: :btree
  add_index "vssc_ballot_styles", ["gp_unit_id"], name: "index_vssc_ballot_styles_on_gp_unit_id", using: :btree
  add_index "vssc_ballot_styles", ["object_id"], name: "index_vssc_ballot_styles_on_object_id", using: :btree

  create_table "vssc_ballot_styles_ordered_contests", id: false, force: :cascade do |t|
    t.integer "ballot_style_id",    limit: 4
    t.integer "ordered_contest_id", limit: 4
  end

  add_index "vssc_ballot_styles_ordered_contests", ["ballot_style_id"], name: "bsoc_ballot_style_id", using: :btree
  add_index "vssc_ballot_styles_ordered_contests", ["ordered_contest_id"], name: "bsoc_ordered_contest_id", using: :btree

  create_table "vssc_candidate_office_refs", force: :cascade do |t|
    t.string   "object_id",    limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "candidate_id", limit: 4
  end

  add_index "vssc_candidate_office_refs", ["candidate_id"], name: "index_vssc_candidate_office_refs_on_candidate_id", using: :btree
  add_index "vssc_candidate_office_refs", ["object_id"], name: "index_vssc_candidate_office_refs_on_object_id", using: :btree

  create_table "vssc_candidate_selection_candidate_refs", force: :cascade do |t|
    t.string   "object_id",              limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "candidate_selection_id", limit: 4
  end

  add_index "vssc_candidate_selection_candidate_refs", ["candidate_selection_id"], name: "cscr_candidate_selection_id", using: :btree
  add_index "vssc_candidate_selection_candidate_refs", ["object_id"], name: "cscr_object_id", using: :btree

  create_table "vssc_candidate_selection_party_refs", force: :cascade do |t|
    t.string   "object_id",              limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "candidate_selection_id", limit: 4
  end

  add_index "vssc_candidate_selection_party_refs", ["candidate_selection_id"], name: "cspr_candidate_selection_id", using: :btree
  add_index "vssc_candidate_selection_party_refs", ["object_id"], name: "cspr_object_id", using: :btree

  create_table "vssc_candidates", force: :cascade do |t|
    t.string   "object_id",      limit: 255
    t.string   "ballot_name",    limit: 255
    t.string   "candidate_id",   limit: 255
    t.string   "party",          limit: 255
    t.string   "person",         limit: 255
    t.datetime "file_date"
    t.boolean  "is_incumbent",   limit: 1
    t.boolean  "is_top_ticket",  limit: 1
    t.integer  "sequence_order", limit: 4
    t.string   "status",         limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "person_id",      limit: 4
    t.integer  "election_id",    limit: 4
  end

  add_index "vssc_candidates", ["election_id"], name: "index_vssc_candidates_on_election_id", using: :btree
  add_index "vssc_candidates", ["object_id"], name: "index_vssc_candidates_on_object_id", using: :btree
  add_index "vssc_candidates", ["person_id"], name: "index_vssc_candidates_on_person_id", using: :btree

  create_table "vssc_contacts", force: :cascade do |t|
    t.string   "object_id",          limit: 255
    t.string   "name",               limit: 255
    t.string   "url",                limit: 255
    t.string   "address_number",     limit: 255
    t.string   "street_name",        limit: 255
    t.string   "city",               limit: 255
    t.string   "state_abbreviation", limit: 255
    t.string   "postal_code",        limit: 255
    t.string   "country",            limit: 255
    t.string   "email",              limit: 255
    t.string   "fax",                limit: 255
    t.string   "phone",              limit: 255
    t.string   "hours",              limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "vssc_contacts", ["object_id"], name: "index_vssc_contacts_on_object_id", using: :btree

  create_table "vssc_contacts_gp_units", id: false, force: :cascade do |t|
    t.integer "contact_id",        limit: 4
    t.integer "reporting_unit_id", limit: 4
  end

  add_index "vssc_contacts_gp_units", ["contact_id"], name: "index_vssc_contacts_gp_units_on_contact_id", using: :btree
  add_index "vssc_contacts_gp_units", ["reporting_unit_id"], name: "index_vssc_contacts_gp_units_on_reporting_unit_id", using: :btree

  create_table "vssc_contacts_people", id: false, force: :cascade do |t|
    t.integer "contact_id", limit: 4
    t.integer "person_id",  limit: 4
  end

  add_index "vssc_contacts_people", ["contact_id"], name: "index_vssc_contacts_people_on_contact_id", using: :btree
  add_index "vssc_contacts_people", ["person_id"], name: "index_vssc_contacts_people_on_person_id", using: :btree

  create_table "vssc_contest_total_counts", force: :cascade do |t|
    t.integer  "contest_id",     limit: 4
    t.integer  "total_count_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "vssc_contest_total_counts", ["contest_id"], name: "index_vssc_contest_total_counts_on_contest_id", using: :btree
  add_index "vssc_contest_total_counts", ["total_count_id"], name: "index_vssc_contest_total_counts_on_total_count_id", using: :btree

  create_table "vssc_contest_total_counts_by_gp_units", force: :cascade do |t|
    t.integer  "contest_id",     limit: 4
    t.integer  "total_count_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "vssc_contest_total_counts_by_gp_units", ["contest_id"], name: "index_vssc_contest_total_counts_by_gp_units_on_contest_id", using: :btree
  add_index "vssc_contest_total_counts_by_gp_units", ["total_count_id"], name: "index_vssc_contest_total_counts_by_gp_units_on_total_count_id", using: :btree

  create_table "vssc_contests", force: :cascade do |t|
    t.string   "type",                  limit: 255
    t.string   "name",                  limit: 255
    t.string   "object_id",             limit: 255
    t.string   "contest_gp_scope",      limit: 255
    t.string   "abbreviation",          limit: 255
    t.string   "local_contest_code",    limit: 255
    t.string   "national_contest_code", limit: 255
    t.string   "state_contest_code",    limit: 255
    t.integer  "reported_precincts",    limit: 4
    t.integer  "sequence_order",        limit: 4
    t.integer  "total_precincts",       limit: 4
    t.string   "office",                limit: 255
    t.string   "primary_party",         limit: 255
    t.integer  "number_elected",        limit: 4
    t.integer  "votes_allowed",         limit: 4
    t.string   "vote_variation",        limit: 255
    t.text     "full_text",             limit: 65535
    t.text     "summary_text",          limit: 65535
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "election_id",           limit: 4
  end

  add_index "vssc_contests", ["election_id"], name: "index_vssc_contests_on_election_id", using: :btree
  add_index "vssc_contests", ["object_id"], name: "index_vssc_contests_on_object_id", using: :btree

  create_table "vssc_counts", force: :cascade do |t|
    t.string   "type",                limit: 255
    t.string   "gp_unit",             limit: 255
    t.string   "object_id",           limit: 255
    t.string   "ballot_type",         limit: 255
    t.string   "device_manufacturer", limit: 255
    t.string   "device_model",        limit: 255
    t.string   "device_type",         limit: 255
    t.integer  "ballots_cast",        limit: 4
    t.integer  "overvotes",           limit: 4
    t.integer  "undervotes",          limit: 4
    t.integer  "write_ins",           limit: 4
    t.float    "count",               limit: 24
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "vssc_counts", ["object_id"], name: "index_vssc_counts_on_object_id", using: :btree

  create_table "vssc_counts_gp_units", id: false, force: :cascade do |t|
    t.integer "gp_unit_id",     limit: 4
    t.integer "total_count_id", limit: 4
  end

  add_index "vssc_counts_gp_units", ["gp_unit_id"], name: "index_vssc_counts_gp_units_on_gp_unit_id", using: :btree
  add_index "vssc_counts_gp_units", ["total_count_id"], name: "index_vssc_counts_gp_units_on_total_count_id", using: :btree

  create_table "vssc_election_reports", force: :cascade do |t|
    t.text     "message",               limit: 65535
    t.string   "object_id",             limit: 255
    t.datetime "date"
    t.string   "format",                limit: 255
    t.string   "status",                limit: 255
    t.string   "issuer",                limit: 255
    t.integer  "sequence",              limit: 4
    t.integer  "sequence_end",          limit: 4
    t.string   "state_abbreviation",    limit: 255
    t.string   "state_code",            limit: 255
    t.string   "vendor_application_id", limit: 255
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "vssc_election_reports", ["object_id"], name: "index_vssc_election_reports_on_object_id", using: :btree

  create_table "vssc_election_reports_gp_units", id: false, force: :cascade do |t|
    t.integer "election_report_id", limit: 4
    t.integer "gp_unit_id",         limit: 4
  end

  add_index "vssc_election_reports_gp_units", ["election_report_id"], name: "index_vssc_election_reports_gp_units_on_election_report_id", using: :btree
  add_index "vssc_election_reports_gp_units", ["gp_unit_id"], name: "index_vssc_election_reports_gp_units_on_gp_unit_id", using: :btree

  create_table "vssc_election_reports_offices", id: false, force: :cascade do |t|
    t.integer "election_report_id", limit: 4
    t.integer "office_id",          limit: 4
  end

  add_index "vssc_election_reports_offices", ["election_report_id"], name: "index_vssc_election_reports_offices_on_election_report_id", using: :btree
  add_index "vssc_election_reports_offices", ["office_id"], name: "index_vssc_election_reports_offices_on_office_id", using: :btree

  create_table "vssc_election_reports_people", id: false, force: :cascade do |t|
    t.integer "election_report_id", limit: 4
    t.integer "person_id",          limit: 4
  end

  add_index "vssc_election_reports_people", ["election_report_id"], name: "index_vssc_election_reports_people_on_election_report_id", using: :btree
  add_index "vssc_election_reports_people", ["person_id"], name: "index_vssc_election_reports_people_on_person_id", using: :btree

  create_table "vssc_elections", force: :cascade do |t|
    t.string   "object_id",                 limit: 255
    t.string   "name",                      limit: 255
    t.string   "election_type",             limit: 255
    t.string   "election_gp_scope",         limit: 255
    t.date     "date"
    t.string   "url",                       limit: 255
    t.string   "absentee_count_status",     limit: 255
    t.string   "early_count_status",        limit: 255
    t.string   "election_day_count_status", limit: 255
    t.string   "provisional_count_status",  limit: 255
    t.string   "write_in_count_status",     limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "election_report_id",        limit: 4
  end

  add_index "vssc_elections", ["election_report_id"], name: "index_vssc_elections_on_election_report_id", using: :btree
  add_index "vssc_elections", ["object_id"], name: "index_vssc_elections_on_object_id", using: :btree

  create_table "vssc_gp_sub_unit_refs", force: :cascade do |t|
    t.string   "object_id",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "gp_unit_id", limit: 4
  end

  add_index "vssc_gp_sub_unit_refs", ["gp_unit_id"], name: "index_vssc_gp_sub_unit_refs_on_gp_unit_id", using: :btree
  add_index "vssc_gp_sub_unit_refs", ["object_id"], name: "index_vssc_gp_sub_unit_refs_on_object_id", using: :btree

  create_table "vssc_gp_units", force: :cascade do |t|
    t.string   "type",                       limit: 255
    t.string   "object_id",                  limit: 255
    t.string   "url",                        limit: 255
    t.string   "local_geo_code",             limit: 255
    t.string   "name",                       limit: 255
    t.string   "national_geo_code",          limit: 255
    t.string   "state_geo_code",             limit: 255
    t.boolean  "has_reported",               limit: 1
    t.integer  "registered_voters",          limit: 4
    t.integer  "reported_precincts",         limit: 4
    t.string   "reporting_unit_type",        limit: 255
    t.integer  "total_participating_voters", limit: 4
    t.integer  "total_precincts",            limit: 4
    t.string   "device_type",                limit: 255
    t.string   "manufacturer",               limit: 255
    t.string   "serial_number",              limit: 255
    t.string   "district_type",              limit: 255
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "party_registration_id",      limit: 4
    t.integer  "gp_unit_id",                 limit: 4
  end

  add_index "vssc_gp_units", ["gp_unit_id"], name: "index_vssc_gp_units_on_gp_unit_id", using: :btree
  add_index "vssc_gp_units", ["object_id"], name: "index_vssc_gp_units_on_object_id", using: :btree
  add_index "vssc_gp_units", ["party_registration_id"], name: "index_vssc_gp_units_on_party_registration_id", using: :btree

  create_table "vssc_gp_units_spatial_dimensions", id: false, force: :cascade do |t|
    t.integer "gp_unit_id",           limit: 4
    t.integer "spatial_dimension_id", limit: 4
  end

  add_index "vssc_gp_units_spatial_dimensions", ["gp_unit_id"], name: "index_vssc_gp_units_spatial_dimensions_on_gp_unit_id", using: :btree
  add_index "vssc_gp_units_spatial_dimensions", ["spatial_dimension_id"], name: "index_vssc_gp_units_spatial_dimensions_on_spatial_dimension_id", using: :btree

  create_table "vssc_offices", force: :cascade do |t|
    t.string   "object_id",            limit: 255
    t.string   "name",                 limit: 255
    t.string   "office_gp_scope",      limit: 255
    t.datetime "filing_date"
    t.boolean  "incumbent_running",    limit: 1
    t.string   "local_office_code",    limit: 255
    t.string   "national_office_code", limit: 255
    t.string   "state_office_code",    limit: 255
    t.boolean  "partisan",             limit: 1
    t.date     "term_start_date"
    t.date     "term_end_date"
    t.boolean  "unexpired_term",       limit: 1
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "vssc_offices", ["object_id"], name: "index_vssc_offices_on_object_id", using: :btree

  create_table "vssc_ordered_contest_ballot_selection_refs", force: :cascade do |t|
    t.string   "object_id",          limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "ordered_contest_id", limit: 4
  end

  add_index "vssc_ordered_contest_ballot_selection_refs", ["object_id"], name: "ocbsr_object_id", using: :btree
  add_index "vssc_ordered_contest_ballot_selection_refs", ["ordered_contest_id"], name: "ocbsr_ordered_contest_id", using: :btree

  create_table "vssc_ordered_contests", force: :cascade do |t|
    t.string   "object_id",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "contest_id", limit: 4
  end

  add_index "vssc_ordered_contests", ["contest_id"], name: "index_vssc_ordered_contests_on_contest_id", using: :btree
  add_index "vssc_ordered_contests", ["object_id"], name: "index_vssc_ordered_contests_on_object_id", using: :btree

  create_table "vssc_parties", force: :cascade do |t|
    t.string   "object_id",           limit: 255
    t.string   "abbreviation",        limit: 255
    t.string   "local_party_code",    limit: 255
    t.string   "name",                limit: 255
    t.string   "national_party_code", limit: 255
    t.string   "state_party_code",    limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "vssc_parties", ["object_id"], name: "index_vssc_parties_on_object_id", using: :btree

  create_table "vssc_party_registrations", force: :cascade do |t|
    t.string   "object_id",  limit: 255
    t.string   "party",      limit: 255
    t.integer  "count",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "vssc_party_registrations", ["object_id"], name: "index_vssc_party_registrations_on_object_id", using: :btree

  create_table "vssc_people", force: :cascade do |t|
    t.string   "object_id",   limit: 255
    t.string   "ethnicity",   limit: 255
    t.string   "gender",      limit: 255
    t.string   "first_name",  limit: 255
    t.string   "last_name",   limit: 255
    t.string   "middle_name", limit: 255
    t.string   "prefix",      limit: 255
    t.string   "suffix",      limit: 255
    t.string   "title",       limit: 255
    t.string   "profession",  limit: 255
    t.string   "nickname",    limit: 255
    t.string   "party",       limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "vssc_people", ["object_id"], name: "index_vssc_people_on_object_id", using: :btree

  create_table "vssc_reporting_unit_authority_refs", force: :cascade do |t|
    t.string   "object_id",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "gp_unit_id", limit: 4
  end

  add_index "vssc_reporting_unit_authority_refs", ["gp_unit_id"], name: "ruar_reporting_unit_id", using: :btree
  add_index "vssc_reporting_unit_authority_refs", ["object_id"], name: "ruar_object_id", using: :btree

  create_table "vssc_spatial_dimensions", force: :cascade do |t|
    t.string   "object_id",         limit: 255
    t.text     "map",               limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "spatial_extent_id", limit: 4
  end

  add_index "vssc_spatial_dimensions", ["object_id"], name: "index_vssc_spatial_dimensions_on_object_id", using: :btree
  add_index "vssc_spatial_dimensions", ["spatial_extent_id"], name: "index_vssc_spatial_dimensions_on_spatial_extent_id", using: :btree

  create_table "vssc_spatial_extents", force: :cascade do |t|
    t.string   "object_id",            limit: 255
    t.string   "format",               limit: 255
    t.text     "coordinates",          limit: 65535
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "spatial_dimension_id", limit: 4
  end

  add_index "vssc_spatial_extents", ["object_id"], name: "index_vssc_spatial_extents_on_object_id", using: :btree
  add_index "vssc_spatial_extents", ["spatial_dimension_id"], name: "index_vssc_spatial_extents_on_spatial_dimension_id", using: :btree

end
