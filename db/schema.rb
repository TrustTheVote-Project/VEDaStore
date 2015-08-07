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

ActiveRecord::Schema.define(version: 25) do

  create_table "vssc_ballot_selection_candidate_ids", force: :cascade do |t|
    t.integer "vssc_ballot_selection_id", limit: 4
    t.string  "candidate_id_ref",         limit: 255
  end

  create_table "vssc_ballot_selection_endorsement_party_ids", force: :cascade do |t|
    t.integer "vssc_ballot_selection_id", limit: 4
    t.string  "party_id_refs",            limit: 255
  end

  create_table "vssc_ballot_selection_party_ids", force: :cascade do |t|
    t.integer "vssc_ballot_selection_id", limit: 4
    t.string  "party_id_refs",            limit: 255
  end

  create_table "vssc_ballot_selections", force: :cascade do |t|
    t.string   "type",         limit: 255
    t.string   "object_id",    limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "selection_id", limit: 4
    t.boolean  "is_write_in",  limit: 1
  end

  create_table "vssc_ballot_style_gp_unit_ids", force: :cascade do |t|
    t.string  "gp_unit_id_ref",       limit: 255
    t.integer "vssc_ballot_style_id", limit: 4
  end

  create_table "vssc_ballot_style_party_ids", force: :cascade do |t|
    t.string  "party_id_ref",         limit: 255
    t.integer "vssc_ballot_style_id", limit: 4
  end

  create_table "vssc_ballot_styles", force: :cascade do |t|
    t.string   "image_uri",               limit: 255
    t.string   "ballot_style_identifier", limit: 255
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "vssc_candidates", force: :cascade do |t|
    t.integer  "ballot_name_id",       limit: 4
    t.string   "party_identifier",     limit: 255
    t.string   "person_identifier",    limit: 255
    t.string   "object_id",            limit: 255
    t.date     "file_date"
    t.string   "candidate_identifier", limit: 255
    t.boolean  "is_incumbent",         limit: 1
    t.boolean  "is_top_ticket",        limit: 1
    t.string   "post_election_status", limit: 255
    t.string   "pre_election_status",  limit: 255
    t.integer  "sequence_order",       limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "vssc_codes", force: :cascade do |t|
    t.string   "codeable_type", limit: 255
    t.integer  "codeable_id",   limit: 4
    t.string   "other_type",    limit: 255
    t.string   "code_type",     limit: 255
    t.string   "value",         limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "vssc_contact_information", force: :cascade do |t|
    t.text     "address_line", limit: 65535
    t.text     "email",        limit: 65535
    t.text     "fax",          limit: 65535
    t.string   "name",         limit: 255
    t.text     "phone",        limit: 65535
    t.text     "uri",          limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "vssc_contest_office_ids", force: :cascade do |t|
    t.integer "vssc_contest_id", limit: 4
    t.string  "office_id_ref",   limit: 255
  end

  create_table "vssc_contests", force: :cascade do |t|
    t.string   "type",                            limit: 255
    t.integer  "ballot_sub_title_id",             limit: 4
    t.integer  "ballot_title_id",                 limit: 4
    t.string   "jurisdictional_scope_identifier", limit: 255
    t.string   "name",                            limit: 255
    t.string   "object_id",                       limit: 255
    t.string   "abbreviation",                    limit: 255
    t.boolean  "has_rotation",                    limit: 1
    t.string   "other_vote_variation_type",       limit: 255
    t.integer  "sequence_order",                  limit: 4
    t.integer  "sub_units_reported",              limit: 4
    t.integer  "total_sub_units",                 limit: 4
    t.string   "vote_variation_type",             limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "con_statement_id",                limit: 4
    t.integer  "effect_of_abstain_id",            limit: 4
    t.integer  "full_text_id",                    limit: 4
    t.integer  "passage_threshold_id",            limit: 4
    t.integer  "pro_statement_id",                limit: 4
    t.integer  "summary_text_id",                 limit: 4
    t.string   "other_type",                      limit: 255
    t.string   "ballot_measure_type",             limit: 255
    t.string   "primary_party_identifier",        limit: 255
    t.integer  "number_elected",                  limit: 4
    t.integer  "votes_allowed",                   limit: 4
    t.string   "candidate_identifier",            limit: 255
    t.string   "office_identifier",               limit: 255
  end

  create_table "vssc_count_statuses", force: :cascade do |t|
    t.integer  "count_statusable_id",   limit: 4
    t.string   "count_statusable_type", limit: 255
    t.string   "other_type",            limit: 255
    t.string   "status",                limit: 255
    t.string   "count_item_type",       limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "vssc_counts", force: :cascade do |t|
    t.string   "type",                limit: 255
    t.integer  "vssc_device_id",      limit: 4
    t.string   "gp_unit_identifier",  limit: 255
    t.string   "other_type",          limit: 255
    t.string   "count_item_type",     limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "ballots_cast",        limit: 4
    t.integer  "ballots_outstanding", limit: 4
    t.integer  "ballots_rejected",    limit: 4
    t.integer  "overvotes",           limit: 4
    t.integer  "undervotes",          limit: 4
    t.integer  "write_ins",           limit: 4
    t.float    "count",               limit: 24
  end

  create_table "vssc_devices", force: :cascade do |t|
    t.string   "manufacturer", limit: 255
    t.string   "model",        limit: 255
    t.string   "device_type",  limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "vssc_election_reports", force: :cascade do |t|
    t.string   "message",                       limit: 255
    t.string   "vssc_election_id",              limit: 255
    t.text     "notes",                         limit: 65535
    t.string   "format",                        limit: 255
    t.datetime "generated_date"
    t.string   "issuer",                        limit: 255
    t.string   "issuer_abbreviation",           limit: 255
    t.boolean  "is_test",                       limit: 1
    t.integer  "sequence",                      limit: 4
    t.integer  "sequence_end",                  limit: 4
    t.string   "status",                        limit: 255
    t.string   "test_type",                     limit: 255
    t.string   "vendor_application_identifier", limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "vssc_elections", force: :cascade do |t|
    t.integer  "vssc_contact_information_id", limit: 4
    t.string   "election_scope_identifier",   limit: 255
    t.integer  "name_id",                     limit: 4
    t.date     "date"
    t.date     "end_date"
    t.string   "election_type",               limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "vssc_gp_unit_authority_ids", force: :cascade do |t|
    t.integer "vssc_gp_unit_id",   limit: 4
    t.string  "authority_id_refs", limit: 255
  end

  create_table "vssc_gp_unit_composing_gp_unit_id_refs", force: :cascade do |t|
    t.integer "vssc_gp_unit_id",          limit: 4
    t.string  "composing_gp_unit_id_ref", limit: 255
  end

  create_table "vssc_gp_units", force: :cascade do |t|
    t.string   "type",                   limit: 255
    t.string   "object_id",              limit: 255
    t.string   "name",                   limit: 255
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "device_id",              limit: 4
    t.string   "serial_number",          limit: 255
    t.integer  "contact_information_id", limit: 4
    t.text     "count_statuses",         limit: 65535
    t.integer  "spatial_dimension_id",   limit: 4
    t.boolean  "is_electoral_district",  limit: 1
    t.string   "other_type",             limit: 255
    t.integer  "sub_units_reported",     limit: 4
    t.integer  "total_sub_units",        limit: 4
    t.string   "reporting_unit_type",    limit: 255
    t.integer  "voters_participated",    limit: 4
    t.integer  "voters_registered",      limit: 4
  end

  create_table "vssc_hours", force: :cascade do |t|
    t.string   "day",        limit: 255
    t.datetime "end_time"
    t.datetime "start_time"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "vssc_internationalized_texts", force: :cascade do |t|
    t.string   "identifier", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "vssc_language_strings", force: :cascade do |t|
    t.string   "language",   limit: 255
    t.text     "text",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "vssc_office_group_office_ids", force: :cascade do |t|
    t.integer "vssc_office_id", limit: 4
    t.string  "office_id_ref",  limit: 255
  end

  create_table "vssc_office_groups", force: :cascade do |t|
    t.integer  "office_groupable_id",   limit: 4
    t.string   "office_groupable_type", limit: 255
    t.string   "name",                  limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "vssc_office_office_holders", force: :cascade do |t|
    t.integer "vssc_office_id",       limit: 4
    t.string  "office_holder_id_ref", limit: 255
  end

  create_table "vssc_offices", force: :cascade do |t|
    t.integer  "vssc_office_group_id",            limit: 4
    t.integer  "vssc_contact_information_id",     limit: 4
    t.string   "jurisdictional_scope_identifier", limit: 255
    t.integer  "name_id",                         limit: 4
    t.integer  "term_id",                         limit: 4
    t.string   "object_id",                       limit: 255
    t.datetime "filing_deadline"
    t.boolean  "is_partisan",                     limit: 1
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "vssc_ordered_contest_ordered_ballot_selection_ids", force: :cascade do |t|
    t.integer "vssc_ordered_contest_id",         limit: 4
    t.string  "ordered_ballot_selection_id_ref", limit: 255
  end

  create_table "vssc_ordered_contests", force: :cascade do |t|
    t.string   "contest_identifier", limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "vssc_parties", force: :cascade do |t|
    t.integer  "name_id",            limit: 4
    t.string   "object_id",          limit: 255
    t.string   "abbreviation",       limit: 255
    t.string   "color",              limit: 255
    t.string   "logo_uri",           limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "contest_identifier", limit: 255
  end

  create_table "vssc_party_party_ids", force: :cascade do |t|
    t.integer "vssc_party_id", limit: 4
    t.string  "party_id_ref",  limit: 255
  end

  create_table "vssc_party_registrations", force: :cascade do |t|
    t.string   "type",                        limit: 255
    t.string   "party_identifier",            limit: 255
    t.integer  "count",                       limit: 4
    t.integer  "party_registrationable_id",   limit: 4
    t.string   "party_registrationable_type", limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "vssc_people", force: :cascade do |t|
    t.string   "first_name",       limit: 255
    t.integer  "full_name_id",     limit: 4
    t.string   "last_name",        limit: 255
    t.text     "middle_names",     limit: 65535
    t.string   "nickname",         limit: 255
    t.string   "party_identifier", limit: 255
    t.string   "prefix",           limit: 255
    t.integer  "profession_id",    limit: 4
    t.string   "sufix",            limit: 255
    t.integer  "title_id",         limit: 4
    t.string   "object_id",        limit: 255
    t.date     "date_of_birth"
    t.string   "gender",           limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "vssc_schedules", force: :cascade do |t|
    t.date     "end_date"
    t.date     "start_date"
    t.boolean  "is_only_by_appointment", limit: 1
    t.boolean  "is_or_by_appointment",   limit: 1
    t.boolean  "is_subject_to_change",   limit: 1
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "vssc_spatial_dimensions", force: :cascade do |t|
    t.integer  "spatial_extent_id", limit: 4
    t.string   "map_uri",           limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "vssc_spatial_extents", force: :cascade do |t|
    t.text     "coordinates", limit: 65535
    t.string   "format",      limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "vssc_terms", force: :cascade do |t|
    t.date     "end_date"
    t.date     "start_date"
    t.string   "office_term_type", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

end
