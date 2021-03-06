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

ActiveRecord::Schema.define(version: 20170814012600) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "funds", force: :cascade do |t|
    t.string "name"
    t.integer "contribution_amount_cents"
    t.bigint "year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["year_id"], name: "index_funds_on_year_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_members_on_email", unique: true
  end

  create_table "questionaires", force: :cascade do |t|
    t.integer "year_id"
    t.integer "member_id"
    t.string "token"
    t.datetime "available_meeting_times", array: true
    t.integer "contributing_fund_ids", array: true
    t.datetime "delivered_at"
    t.datetime "completed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "paid_at"
    t.string "payment_token"
  end

  create_table "years", force: :cascade do |t|
    t.integer "calendar_year"
    t.string "next_task"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dues_cents", default: 0
    t.datetime "potential_meeting_times", default: [], array: true
    t.index ["calendar_year"], name: "index_years_on_calendar_year", unique: true
  end

end
