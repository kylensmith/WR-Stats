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

ActiveRecord::Schema.define(version: 20160824181958) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aa_place_winners", force: :cascade do |t|
    t.integer  "wrestler_id"
    t.integer  "division_id"
    t.integer  "school_id"
    t.integer  "season_id"
    t.string   "weight"
    t.integer  "place"
    t.string   "ordinal"
    t.integer  "event_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "aa_wrestlers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "all_americans", force: :cascade do |t|
    t.integer  "division_id"
    t.integer  "season_id"
    t.string   "weight"
    t.integer  "place"
    t.integer  "wrestler_id"
    t.integer  "school_id"
    t.integer  "event_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "authors", force: :cascade do |t|
    t.string   "author_code"
    t.string   "author"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "bouts", force: :cascade do |t|
    t.integer  "season_id"
    t.string   "weight"
    t.integer  "bracket"
    t.integer  "round"
    t.integer  "winner_id"
    t.integer  "loser_id"
    t.string   "score"
    t.integer  "decision_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "bracket_olympics", force: :cascade do |t|
    t.integer  "year"
    t.string   "weight"
    t.integer  "bracket"
    t.integer  "round"
    t.integer  "winner"
    t.integer  "loser"
    t.string   "score"
    t.integer  "decision_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "bracket_types", force: :cascade do |t|
    t.integer  "bracket_id"
    t.string   "bracket_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "brackets", force: :cascade do |t|
    t.integer  "season_id"
    t.string   "weight"
    t.integer  "round101"
    t.string   "round101_result"
    t.integer  "round102"
    t.string   "round102_result"
    t.integer  "round103"
    t.string   "round103_result"
    t.integer  "round104"
    t.string   "round104_result"
    t.integer  "round105"
    t.string   "round105_result"
    t.integer  "round106"
    t.string   "round106_result"
    t.integer  "round107"
    t.string   "round107_result"
    t.integer  "round108"
    t.string   "round108_result"
    t.integer  "round109"
    t.string   "round109_result"
    t.integer  "round110"
    t.string   "round110_result"
    t.integer  "round111"
    t.string   "round111_result"
    t.integer  "round112"
    t.string   "round112_result"
    t.integer  "round113"
    t.string   "round113_result"
    t.integer  "round114"
    t.string   "round114_result"
    t.integer  "round115"
    t.string   "round115_result"
    t.integer  "round116"
    t.string   "round116_result"
    t.integer  "round21"
    t.string   "round21_result"
    t.integer  "round22"
    t.string   "round22_result"
    t.integer  "round23"
    t.string   "round23_result"
    t.integer  "round24"
    t.string   "round24_result"
    t.integer  "round25"
    t.string   "round25_result"
    t.integer  "round26"
    t.string   "round26_result"
    t.integer  "round27"
    t.string   "round27_result"
    t.integer  "round28"
    t.string   "round28_result"
    t.integer  "qf1"
    t.string   "qf1_result"
    t.integer  "qf2"
    t.string   "qf2_result"
    t.integer  "qf3"
    t.string   "qf3_result"
    t.integer  "qf4"
    t.string   "qf4_result"
    t.integer  "sf1"
    t.string   "sf1_result"
    t.integer  "sf2"
    t.string   "sf2_result"
    t.integer  "champ"
    t.string   "champ_result"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "builds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "champ_bouts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "champs", force: :cascade do |t|
    t.integer  "wrestler_id"
    t.string   "wrestler"
    t.integer  "titles"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "coach_awards", force: :cascade do |t|
    t.integer  "coach_id"
    t.integer  "totalchamps"
    t.integer  "totalaas"
    t.float    "goldpct"
    t.float    "aapct"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "coach_records", force: :cascade do |t|
    t.integer  "coach_id"
    t.integer  "seasons"
    t.integer  "total_duals"
    t.integer  "total_wins"
    t.integer  "total_losses"
    t.integer  "total_ties"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "coaches", force: :cascade do |t|
    t.integer  "coach_id"
    t.string   "name"
    t.string   "lname"
    t.string   "fname"
    t.boolean  "active"
    t.integer  "total_seasons"
    t.integer  "total_duals"
    t.integer  "total_wins"
    t.integer  "total_losses"
    t.integer  "total_ties"
    t.float    "win_percentage"
    t.integer  "total_champs"
    t.integer  "total_aas"
    t.float    "aa_percentage"
    t.float    "champ_percentage"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "consolation_inputs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consolations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contestants", force: :cascade do |t|
    t.integer  "season_id"
    t.string   "weight"
    t.integer  "wrestler_id"
    t.integer  "bracket_position"
    t.integer  "consolation_position"
    t.integer  "seed"
    t.integer  "place"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "divisions", force: :cascade do |t|
    t.string   "event"
    t.string   "alternate_name"
    t.integer  "start_year"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "dual_brackets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dual_consolations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dual_meets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dual_seasons", force: :cascade do |t|
    t.integer  "season_id"
    t.integer  "school_id"
    t.integer  "division_id"
    t.integer  "coach_id"
    t.integer  "duals"
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "ties"
    t.boolean  "non_di"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "duals", force: :cascade do |t|
    t.integer  "season_id"
    t.date     "date"
    t.time     "time"
    t.integer  "site"
    t.integer  "team1_id"
    t.integer  "team2_id"
    t.float    "team1_score"
    t.float    "team2_score"
    t.boolean  "tie_break"
    t.integer  "w"
    t.integer  "l"
    t.boolean  "t"
    t.integer  "attendance"
    t.boolean  "complete"
    t.boolean  "estimated"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "division_id"
    t.integer  "season_id"
    t.integer  "hofeventid"
    t.string   "ordinal"
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "location"
    t.integer  "team_champion"
    t.integer  "champs"
    t.float    "winners_points"
    t.text     "outstanding_wrestler"
    t.integer  "ow_wrestler_id"
    t.integer  "ow_school_id"
    t.integer  "total_schools"
    t.integer  "total_participants"
    t.integer  "total_points"
    t.integer  "weight_classes"
    t.integer  "places"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "gorrarians", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hof_events", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "event_name"
    t.integer  "event_year"
    t.integer  "sponsor_id"
    t.integer  "division_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "hof_honorees", force: :cascade do |t|
    t.integer  "honoree_id"
    t.string   "fname"
    t.string   "lname"
    t.string   "mname"
    t.string   "nickname"
    t.integer  "year_inducted"
    t.integer  "honoree_type"
    t.integer  "wrestler_id"
    t.integer  "coach_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "leagues", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "national_dual_schools", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "national_dual_summaries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ncaa_bouts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ncaa_champ_data", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ncaa_champs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ncaa_features", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ncaa_final_details", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ncaa_final_points", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ncaa_final_records", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ncaa_final_stallings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ncaa_finals", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "outstanding_wrestlers", force: :cascade do |t|
    t.integer  "division_id"
    t.integer  "season_id"
    t.integer  "wrestler_id"
    t.integer  "school_id"
    t.integer  "event_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "pigtails", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "place_names", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "place_scores", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "place_winners", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ranking_individuals", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "result_types", force: :cascade do |t|
    t.string   "result_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "rounds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sayengas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "school_bye_extras", force: :cascade do |t|
    t.integer  "season_id"
    t.integer  "school_id"
    t.integer  "byepoints"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "school_droppeds", force: :cascade do |t|
    t.integer  "season_id"
    t.integer  "school_id"
    t.integer  "league"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "school_duals", force: :cascade do |t|
    t.integer  "school_id"
    t.integer  "current_division"
    t.integer  "first_season"
    t.integer  "last_season"
    t.integer  "seasons"
    t.integer  "total_duals"
    t.integer  "total_wins"
    t.integer  "total_losses"
    t.integer  "total_ties"
    t.boolean  "complete"
    t.integer  "missing_record"
    t.integer  "missing_coach"
    t.boolean  "dropped"
    t.integer  "year_dropped"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "school_participations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "school_seasons", force: :cascade do |t|
    t.integer  "season_id"
    t.integer  "school_id"
    t.integer  "coach_id"
    t.float    "points"
    t.integer  "place"
    t.integer  "champs"
    t.integer  "place_winners"
    t.integer  "division_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "school_values", force: :cascade do |t|
    t.integer  "season_id"
    t.integer  "school_id"
    t.integer  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.integer  "hof_id"
    t.string   "name"
    t.integer  "current_division"
    t.string   "city"
    t.integer  "state_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "score_types", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scorings", force: :cascade do |t|
    t.integer  "season_id"
    t.integer  "first"
    t.integer  "second"
    t.integer  "third"
    t.integer  "fourth"
    t.integer  "fifth"
    t.integer  "sixth"
    t.integer  "seventh"
    t.integer  "eighth"
    t.float    "advance"
    t.float    "consolation"
    t.integer  "fall"
    t.integer  "fft"
    t.integer  "tf"
    t.integer  "sd"
    t.integer  "md"
    t.string   "notes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "seasons", id: false, force: :cascade do |t|
    t.integer  "year",                 null: false
    t.datetime "last_update"
    t.integer  "word_count"
    t.integer  "start_date"
    t.integer  "end_date"
    t.string   "location"
    t.integer  "team_champ_id"
    t.integer  "champion_points"
    t.integer  "total_schools"
    t.integer  "total_participants"
    t.integer  "total_bouts"
    t.integer  "total_points"
    t.integer  "total_weight_classes"
    t.integer  "places"
    t.boolean  "complete"
    t.boolean  "audited"
    t.integer  "jpeg"
    t.string   "jpeg_path"
    t.integer  "hofeventid"
    t.string   "comments"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "seasons", ["year"], name: "index_seasons_on_year", unique: true, using: :btree

  create_table "seeds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_ranking_releases", force: :cascade do |t|
    t.integer  "season_id"
    t.date     "date"
    t.integer  "teams_ranked"
    t.boolean  "nwca"
    t.string   "poll_name"
    t.string   "alt_name"
    t.boolean  "dual_ranking"
    t.integer  "division_id"
    t.string   "date_text"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "team_rankings", force: :cascade do |t|
    t.integer  "season_id"
    t.integer  "team_ranking_release_id"
    t.integer  "rank"
    t.integer  "school_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "team_scores", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "division_id"
    t.integer  "season_id"
    t.integer  "school_id"
    t.integer  "coach_id"
    t.float    "points"
    t.integer  "place"
    t.integer  "champs"
    t.integer  "place_winners"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.boolean  "admin",                  default: false
    t.boolean  "super_admin",            default: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "weight_classes", force: :cascade do |t|
    t.integer  "season_id"
    t.string   "weight"
    t.integer  "entries"
    t.integer  "rounds"
    t.boolean  "left_column"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "wrestler_d1_records", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wrestler_schools", force: :cascade do |t|
    t.integer  "season_id"
    t.integer  "wrestler_id"
    t.integer  "school_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "wrestlers", force: :cascade do |t|
    t.string   "name"
    t.integer  "hofid"
    t.boolean  "all_american"
    t.boolean  "transfer"
    t.boolean  "division_i"
    t.boolean  "division_ii"
    t.boolean  "division_iii"
    t.boolean  "naia"
    t.boolean  "njcaa"
    t.boolean  "eiwa"
    t.boolean  "big_10"
    t.boolean  "big_12"
    t.string   "high_school"
    t.integer  "state"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
