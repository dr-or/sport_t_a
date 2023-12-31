# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_18_103025) do
  create_table "matches", force: :cascade do |t|
    t.datetime "match_date"
    t.integer "home_team_id"
    t.integer "away_team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "performances", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "result_id", null: false
    t.integer "match_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_performances_on_match_id"
    t.index ["player_id", "result_id", "match_id"], name: "index_performances_on_player_id_and_result_id_and_match_id", unique: true
    t.index ["player_id"], name: "index_performances_on_player_id"
    t.index ["result_id"], name: "index_performances_on_result_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_id", null: false
    t.string "last_name"
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "results", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["body"], name: "index_results_on_body", unique: true
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "matches", "teams", column: "away_team_id"
  add_foreign_key "matches", "teams", column: "home_team_id"
  add_foreign_key "performances", "matches"
  add_foreign_key "performances", "players"
  add_foreign_key "performances", "results"
  add_foreign_key "players", "teams"
end
