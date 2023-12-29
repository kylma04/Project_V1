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

ActiveRecord::Schema[7.1].define(version: 2023_12_12_172636) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "missing_days", force: :cascade do |t|
    t.bigint "participant_id", null: false
    t.date "start", null: false
    t.date "end", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_missing_days_on_participant_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "content", null: false
    t.bigint "participant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_notifications_on_participant_id"
  end

  create_table "participants", force: :cascade do |t|
    t.string "firstname", null: false
    t.string "lastname", null: false
    t.integer "age"
    t.text "email", null: false
    t.integer "phone", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
    t.string "password_digest"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "participant_id", null: false
    t.bigint "tasks_calendar_id", null: false
    t.integer "task_individual_notes", null: false
    t.float "task_final_note", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_tasks_on_participant_id"
    t.index ["tasks_calendar_id"], name: "index_tasks_on_tasks_calendar_id"
  end

  create_table "tasks_calendars", force: :cascade do |t|
    t.date "date_cleaning_task", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tests", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vote_periodes", force: :cascade do |t|
    t.date "periode_begin", null: false
    t.date "periode_end", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.boolean "status", null: false
    t.bigint "vote_periode_id", null: false
    t.string "voter_type", null: false
    t.bigint "voter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vote_periode_id"], name: "index_votes_on_vote_periode_id"
    t.index ["voter_type", "voter_id"], name: "index_votes_on_voter"
  end

  add_foreign_key "missing_days", "participants"
  add_foreign_key "notifications", "participants"
  add_foreign_key "tasks", "participants"
  add_foreign_key "tasks", "tasks_calendars"
  add_foreign_key "votes", "vote_periodes"
end
