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

ActiveRecord::Schema.define(version: 20171020213259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "password_digest"
    t.string "password"
    t.string "password_confirmation"
  end

  create_table "games", force: :cascade do |t|
    t.boolean "deuce", default: false
    t.bigint "server_id"
    t.bigint "receiver_id"
    t.bigint "account_id"
    t.index ["account_id"], name: "index_games_on_account_id"
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "game_id"
    t.integer "score", default: 0
    t.index ["game_id"], name: "index_participants_on_game_id"
    t.index ["player_id"], name: "index_participants_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.bigint "account_id"
    t.index ["account_id"], name: "index_players_on_account_id"
  end

  create_table "points", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "game_id"
    t.boolean "deuce", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_points_on_game_id"
    t.index ["player_id"], name: "index_points_on_player_id"
  end

end
