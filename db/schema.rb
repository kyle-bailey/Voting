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

ActiveRecord::Schema.define(version: 20141112225327) do

  create_table "ballots", force: true do |t|
    t.string   "organization"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "finished_at"
    t.datetime "duration"
    t.text     "instructions"
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
  end

end
