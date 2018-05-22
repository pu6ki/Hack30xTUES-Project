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

ActiveRecord::Schema.define(version: 20180522121115) do

  create_table "contestants", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contestants_schools", id: false, force: :cascade do |t|
    t.integer "contestant_id", null: false
    t.integer "school_id", null: false
    t.index ["contestant_id", "school_id"], name: "index_contestants_schools_on_contestant_id_and_school_id"
  end

  create_table "contests", force: :cascade do |t|
    t.string "title"
    t.string "position"
    t.text "description"
    t.integer "recruiter_id"
    t.integer "technology_id"
    t.datetime "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recruiter_id"], name: "index_contests_on_recruiter_id"
    t.index ["technology_id"], name: "index_contests_on_technology_id"
  end

  create_table "recruiters", force: :cascade do |t|
    t.string "company_name"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recruiters_technologies", id: false, force: :cascade do |t|
    t.integer "recruiter_id", null: false
    t.integer "technology_id", null: false
    t.index ["recruiter_id", "technology_id"], name: "recruiter_technologies"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.integer "points", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "submissions", force: :cascade do |t|
    t.text "source"
    t.integer "points"
    t.integer "contestant_id"
    t.integer "contest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "solving", default: false
    t.index ["contest_id"], name: "index_submissions_on_contest_id"
    t.index ["contestant_id"], name: "index_submissions_on_contestant_id"
  end

  create_table "technologies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "test_cases", force: :cascade do |t|
    t.string "expected_output"
    t.integer "contest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "input"
    t.index ["contest_id"], name: "index_test_cases_on_contest_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "userable_id"
    t.string "userable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "authentication_token", limit: 30
    t.string "description"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["userable_type", "userable_id"], name: "index_users_on_userable_type_and_userable_id"
  end

end
