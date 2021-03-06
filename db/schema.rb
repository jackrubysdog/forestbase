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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120630130629) do

  create_table "appearances", :id => false, :force => true do |t|
    t.integer "id",                          :null => false
    t.integer "player_id"
    t.integer "shirt"
    t.integer "off",         :default => 90
    t.integer "subbedby",    :default => 0
    t.integer "booked"
    t.integer "bookedtime"
    t.integer "sentoff"
    t.integer "sentofftime"
    t.integer "match_id"
  end

  create_table "cities", :id => false, :force => true do |t|
    t.integer "id",         :null => false
    t.text    "name"
    t.integer "country_id"
  end

  create_table "competitions", :id => false, :force => true do |t|
    t.integer "id",            :null => false
    t.string  "abbrev"
    t.string  "name"
    t.integer "domestic"
    t.integer "european"
    t.integer "international"
    t.string  "abbrev2"
  end

  create_table "countries", :id => false, :force => true do |t|
    t.integer "id",   :null => false
    t.text    "name"
    t.text    "code"
  end

  create_table "divisions", :id => false, :force => true do |t|
    t.integer "id",     :null => false
    t.string  "name"
    t.integer "tier"
    t.string  "abbrev"
  end

  create_table "goals", :id => false, :force => true do |t|
    t.integer "id",        :null => false
    t.integer "player_id"
    t.integer "penalty"
    t.integer "time"
    t.integer "match_id"
  end

  create_table "internationals", :force => true do |t|
    t.integer "player_id"
    t.integer "country_id"
    t.date    "matchdate"
    t.string  "competition"
    t.string  "venue"
    t.string  "han"
    t.integer "f"
    t.integer "a"
    t.integer "shirt"
    t.integer "on"
    t.integer "off"
    t.integer "goals"
  end

  create_table "managers", :id => false, :force => true do |t|
    t.integer "id",           :null => false
    t.text    "name"
    t.text    "informalname"
    t.date    "startdate"
    t.date    "enddate"
    t.text    "managertype"
  end

  create_table "matches", :id => false, :force => true do |t|
    t.integer "id",             :null => false
    t.integer "season_id"
    t.date    "matchdate"
    t.integer "opponent_id"
    t.integer "venue_id"
    t.string  "han"
    t.integer "competition_id"
    t.string  "round"
    t.integer "leg"
    t.integer "replay"
    t.integer "f"
    t.integer "a"
    t.integer "ht_f"
    t.integer "ht_a"
    t.integer "extratime"
    t.integer "penalties"
    t.integer "penalties_f"
    t.integer "penalties_a"
    t.integer "referee_id"
    t.integer "attendance"
    t.integer "points"
    t.integer "position"
    t.integer "oppposition"
  end

  create_table "menus", :id => false, :force => true do |t|
    t.integer "id",   :null => false
    t.string  "item"
    t.string  "link"
  end

  create_table "oppappearances", :id => false, :force => true do |t|
    t.integer "id",           :null => false
    t.integer "oppplayer_id"
    t.integer "shirt"
    t.integer "off"
    t.integer "subbedby"
    t.integer "booked"
    t.integer "bookedtime"
    t.integer "sentoff"
    t.integer "sentofftime"
    t.integer "match_id"
  end

  create_table "oppgoals", :id => false, :force => true do |t|
    t.integer "id",           :null => false
    t.integer "oppplayer_id"
    t.integer "time"
    t.integer "penalty"
    t.integer "match_id"
  end

  create_table "opponents", :id => false, :force => true do |t|
    t.integer "id",                 :null => false
    t.string  "name"
    t.string  "shortname"
    t.integer "previousnamestart"
    t.integer "previousnameend"
    t.string  "previousname"
    t.string  "previousname2"
    t.integer "previousnamestart2"
    t.integer "previousnameend2"
    t.integer "city_id"
  end

  create_table "oppowngoals", :id => false, :force => true do |t|
    t.integer "id",           :null => false
    t.integer "oppplayer_id"
    t.integer "time"
    t.integer "match_id"
  end

  create_table "oppplayers", :id => false, :force => true do |t|
    t.integer "id",            :null => false
    t.text    "name"
    t.text    "birthplace"
    t.integer "country_id"
    t.date    "deathdate"
    t.text    "firstnames"
    t.text    "knownname"
    t.date    "birthdate"
    t.text    "playingcareer"
    t.text    "positionfull"
    t.text    "shortname"
  end

  create_table "oppsubstitutes", :id => false, :force => true do |t|
    t.integer "id",           :null => false
    t.integer "oppplayer_id"
    t.integer "shirt"
    t.integer "on"
    t.integer "subbed"
    t.integer "off"
    t.integer "subbedby"
    t.integer "booked"
    t.integer "bookedtime"
    t.integer "sentoff"
    t.integer "sentofftime"
    t.integer "match_id"
  end

  create_table "owngoals", :id => false, :force => true do |t|
    t.integer "id",           :null => false
    t.integer "oppplayer_id"
    t.integer "time"
    t.integer "match_id"
  end

  create_table "players", :id => false, :force => true do |t|
    t.integer "id",                                   :null => false
    t.text    "name"
    t.text    "shortname"
    t.text    "birthplace"
    t.date    "birthdate"
    t.text    "position"
    t.text    "knownname"
    t.text    "firstnames"
    t.date    "deathdate"
    t.integer "country_id"
    t.text    "positionfull"
    t.integer "number"
    t.date    "loandatesigned"
    t.text    "loanedfrom"
    t.date    "datesigned"
    t.text    "signedfrom"
    t.integer "signedfee"
    t.date    "datesold"
    t.text    "soldto"
    t.integer "soldfee"
    t.date    "datesignedsecondspell"
    t.text    "signedfromsecondspell"
    t.integer "signedfeesecondspell"
    t.date    "datesoldsecondspell"
    t.text    "soldtosecondspell"
    t.integer "soldfeesecondspell"
    t.text    "playingcareer"
    t.text    "managerialcareer"
    t.text    "penpicture"
    t.integer "active",                :default => 0
  end

  create_table "referees", :id => false, :force => true do |t|
    t.integer "id",        :null => false
    t.string  "name"
    t.string  "residence"
  end

  create_table "seasons", :id => false, :force => true do |t|
    t.integer "id",          :null => false
    t.string  "season"
    t.integer "division_id"
  end

  create_table "squadnumbers", :id => false, :force => true do |t|
    t.integer "id",        :null => false
    t.integer "player_id"
    t.integer "season_id"
    t.integer "number"
  end

  create_table "substitutes", :id => false, :force => true do |t|
    t.integer "id",          :null => false
    t.integer "player_id"
    t.integer "shirt"
    t.integer "on"
    t.integer "subbed"
    t.integer "off"
    t.integer "subbedby"
    t.integer "booked"
    t.integer "bookedtime"
    t.integer "sentoff"
    t.integer "sentofftime"
    t.integer "match_id"
  end

  create_table "venues", :id => false, :force => true do |t|
    t.integer "id",      :null => false
    t.string  "name"
    t.integer "city_id"
  end

end
