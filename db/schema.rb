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

ActiveRecord::Schema.define(version: 20180422173450) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "first_name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "billing_contact"
    t.string   "billing_company"
    t.string   "billing_address1"
    t.string   "billing_address2"
    t.string   "billing_city"
    t.string   "billing_state"
    t.string   "billing_zip"
    t.string   "billing_phone"
  end

  create_table "events", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.string   "phase"
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "color"
    t.string   "title"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "timesheet_id"
    t.boolean  "billed",       default: false
    t.boolean  "submitted",    default: false
    t.string   "notes"
    t.index ["project_id"], name: "index_events_on_project_id", using: :btree
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "expenses", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.date     "date"
    t.string   "description"
    t.integer  "mileage"
    t.boolean  "reimburseable"
    t.float    "amount"
    t.string   "vendor"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "category"
    t.index ["project_id"], name: "index_expenses_on_project_id", using: :btree
    t.index ["user_id"], name: "index_expenses_on_user_id", using: :btree
  end

  create_table "prints", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "device"
    t.string   "format"
    t.string   "print_format"
    t.boolean  "color"
    t.boolean  "scan"
    t.float    "cost"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "page_count"
    t.date     "date"
    t.index ["project_id"], name: "index_prints_on_project_id", using: :btree
    t.index ["user_id"], name: "index_prints_on_user_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.integer "client_id"
    t.string  "name"
    t.string  "address1"
    t.string  "address2"
    t.string  "city"
    t.string  "sate"
    t.string  "zip"
    t.boolean "active"
    t.text    "description"
    t.integer "square_footage"
    t.string  "status"
    t.string  "number"
    t.index ["client_id"], name: "index_projects_on_client_id", using: :btree
    t.index ["name"], name: "index_projects_on_name", using: :btree
    t.index ["number"], name: "index_projects_on_number", unique: true, using: :btree
  end

  create_table "timesheets", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "status"
    t.boolean  "submitted"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "time_submitted"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_timesheets_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.string   "role"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
  end

end
