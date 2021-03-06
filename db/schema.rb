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

ActiveRecord::Schema.define(version: 2019_12_22_030507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crews", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "color"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "row_order"
    t.index ["row_order"], name: "index_crews_on_row_order"
    t.index ["user_id"], name: "index_crews_on_user_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "color"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "row_order"
    t.index ["row_order"], name: "index_equipment_on_row_order"
    t.index ["user_id"], name: "index_equipment_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_groups", force: :cascade do |t|
    t.integer "task"
    t.integer "equipment"
    t.integer "crew"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_my_groups_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "company_name", default: "", null: false
    t.string "company_address", default: "", null: false
    t.string "city", default: "", null: false
    t.string "state", default: "", null: false
    t.string "zip_code", default: "", null: false
    t.string "email", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_name"], name: "index_organizations_on_company_name", unique: true
  end

  create_table "projects", force: :cascade do |t|
    t.string "job_name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "builder"
    t.integer "lots"
    t.string "supervisor"
    t.string "our_super"
    t.string "phone"
    t.string "email"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.text "location"
    t.integer "lot_count"
    t.integer "task"
    t.integer "crew"
    t.integer "equipment"
    t.integer "my_group"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id"
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "color"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "user_types", force: :cascade do |t|
    t.string "user_type_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_type_name"], name: "index_user_types_on_user_type_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
    t.integer "user_type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
