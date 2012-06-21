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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120619080443) do

  create_table "appearances", :force => true do |t|
    t.integer  "player_id"
    t.integer  "shirt"
    t.integer  "off"
    t.integer  "subbedby"
    t.boolean  "booked"
    t.integer  "bookedtime"
    t.boolean  "sentoff"
    t.integer  "sentofftime"
    t.integer  "match_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "appearances", ["id", "player_id", "match_id"], :name => "app_index"
  add_index "appearances", ["id"], :name => "index_appearances_on_id", :unique => true
  add_index "appearances", ["match_id"], :name => "index_appearances_on_match_id"
  add_index "appearances", ["player_id"], :name => "index_appearances_on_player_id"

  create_table "competitions", :force => true do |t|
    t.string   "abbrev"
    t.string   "name"
    t.boolean  "domestic"
    t.boolean  "european"
    t.boolean  "international"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "divisions", :force => true do |t|
    t.string   "name"
    t.integer  "tier"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goals", :force => true do |t|
    t.integer  "player_id"
    t.boolean  "penalty"
    t.integer  "time"
    t.integer  "match_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "goals", ["id"], :name => "index_goals_on_id", :unique => true
  add_index "goals", ["match_id"], :name => "index_goals_on_match_id"
  add_index "goals", ["player_id"], :name => "index_goals_on_player_id"

  create_table "matches", :force => true do |t|
    t.integer  "season_id"
    t.date     "matchdate"
    t.integer  "opponent_id"
    t.integer  "venue_id"
    t.string   "han"
    t.integer  "competition_id"
    t.string   "round"
    t.integer  "leg"
    t.integer  "replay"
    t.integer  "for"
    t.integer  "against"
    t.integer  "ht_for"
    t.integer  "ht_against"
    t.boolean  "extratime"
    t.boolean  "penalties"
    t.integer  "penaltiesfor"
    t.integer  "penaltiesagainst"
    t.integer  "referee_id"
    t.integer  "attendance"
    t.integer  "points"
    t.integer  "position"
    t.integer  "oppposition"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "matches", ["id", "season_id", "matchdate", "opponent_id", "venue_id", "competition_id", "referee_id"], :name => "mat_index"

  create_table "menus", :force => true do |t|
    t.string   "item"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "opponents", :force => true do |t|
    t.string   "name"
    t.string   "shortname"
    t.integer  "previousnamestart"
    t.integer  "previousnameend"
    t.string   "previousname"
    t.string   "previousname2"
    t.integer  "previousnamestart2"
    t.integer  "previousnameend2"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "opponents", ["id"], :name => "index_opponents_on_id", :unique => true

  create_table "oppplayers", :force => true do |t|
    t.integer  "name"
    t.text     "birthplace"
    t.integer  "country_id"
    t.date     "deathdate"
    t.text     "firstnames"
    t.text     "knownname"
    t.date     "birthdate"
    t.text     "playingcareer"
    t.text     "positionfull"
    t.text     "shortname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "owngoals", :force => true do |t|
    t.integer  "oppplayer_id"
    t.integer  "time"
    t.integer  "match_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.text     "name"
    t.text     "shortname"
    t.text     "birthplace"
    t.date     "birthdate"
    t.text     "position"
    t.text     "knownname"
    t.text     "firstnames"
    t.date     "deathdate"
    t.integer  "country_id"
    t.text     "positionfull"
    t.integer  "number"
    t.date     "loandatesigned"
    t.text     "loanedfrom"
    t.date     "datesigned"
    t.text     "signedfrom"
    t.integer  "signedfee"
    t.date     "datesold"
    t.text     "soldto"
    t.integer  "soldfee"
    t.date     "datesignedsecondspell"
    t.text     "signedfromsecondspell"
    t.integer  "signedfeesecondspell"
    t.date     "datesoldsecondspell"
    t.text     "soldtosecondspell"
    t.integer  "soldfeesecondspell"
    t.text     "playingcareer"
    t.text     "managerialcareer"
    t.text     "penpicture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["id", "name", "country_id"], :name => "pla_index"

  create_table "seasons", :force => true do |t|
    t.string   "season"
    t.integer  "division_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seasons", ["id"], :name => "index_seasons_on_id", :unique => true

  create_table "substitutes", :force => true do |t|
    t.integer  "player_id"
    t.integer  "shirt"
    t.integer  "on"
    t.boolean  "subbed"
    t.integer  "off"
    t.integer  "subbedby"
    t.boolean  "booked"
    t.integer  "bookedtime"
    t.boolean  "sentoff"
    t.integer  "sentofftime"
    t.integer  "match_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "substitutes", ["id"], :name => "index_substitutes_on_id", :unique => true
  add_index "substitutes", ["match_id"], :name => "index_substitutes_on_match_id"
  add_index "substitutes", ["player_id"], :name => "index_substitutes_on_player_id"

end
