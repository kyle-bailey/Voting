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

ActiveRecord::Schema.define(version: 20141201072422) do

  create_table "ballots", force: true do |t|
    t.string   "organization"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "finished_at"
    t.datetime "duration"
    t.text     "instructions"
    t.string   "theme"
  end

  create_table "candidates", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "race_id"
    t.string   "party"
    t.boolean  "selected"
  end

  create_table "demographics", force: true do |t|
    t.integer  "age"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "normal_vision"
    t.integer  "ballot_id"
    t.string   "visual_acuity"
    t.string   "visual_field"
    t.string   "reading_disability"
    t.string   "hearing_impairment"
    t.string   "native_english"
    t.string   "native_language"
    t.string   "political_affiliation"
    t.text     "other"
    t.string   "number_elections"
    t.text     "where_voted"
    t.text     "other_elections"
    t.text     "where_other"
    t.string   "absentee"
    t.string   "worried"
    t.string   "time_pressure"
    t.string   "prevent"
    t.string   "straight_party"
    t.string   "every_office"
    t.string   "unsure"
    t.text     "unsure_explanation"
  end

  create_table "races", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "race_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "category"
    t.integer  "ballot_id"
  end

  create_table "votes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "candidate"
    t.integer  "race_id"
  end

end
