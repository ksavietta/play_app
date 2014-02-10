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

ActiveRecord::Schema.define(version: 20140209232217) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "plays", force: true do |t|
    t.string   "name"
    t.string   "xml_file_name"
    t.string   "xml_content_type"
    t.integer  "xml_file_size"
    t.datetime "xml_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "number_of_lines_spoken"
    t.integer  "longest_speech"
    t.integer  "number_of_scences_role_appears"
    t.integer  "percent_total_scenes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "play_id",                        null: false
  end

end
