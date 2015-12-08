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

ActiveRecord::Schema.define(version: 20151207034148) do

  create_table "matches", force: :cascade do |t|
    t.text     "content"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "matches", ["player_id", "created_at"], name: "index_matches_on_player_id_and_created_at"
  add_index "matches", ["player_id"], name: "index_matches_on_player_id"

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "position"
    t.string   "league"
    t.string   "accounts"
    t.string   "stream"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "region"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "teamid"
  end

end
