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

ActiveRecord::Schema.define(version: 20160920111400) do

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participants", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_participants_on_project_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "project_groupships", force: :cascade do |t|
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "group_id"
    t.index ["group_id"], name: "index_project_groupships_on_group_id"
    t.index ["project_id"], name: "index_project_groupships_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "info"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "status_id",  default: 1
    t.index ["status_id"], name: "index_projects_on_status_id"
  end

  create_table "stages", force: :cascade do |t|
    t.string   "name"
    t.text     "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id"
    t.integer  "num"
    t.index ["project_id"], name: "index_stages_on_project_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "stage_id"
    t.string   "name"
    t.boolean  "team_work?", default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["stage_id"], name: "index_tasks_on_stage_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer  "num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "group_id"
    t.index ["group_id"], name: "index_teams_on_group_id"
  end

  create_table "uploads", force: :cascade do |t|
    t.integer  "task_id"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.index ["task_id"], name: "index_uploads_on_task_id"
    t.index ["user_id"], name: "index_uploads_on_user_id"
  end

  create_table "user_teamships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.boolean  "has_quit?",  default: true
    t.date     "quit_date"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "group_id"
    t.index ["group_id"], name: "index_user_teamships_on_group_id"
    t.index ["team_id"], name: "index_user_teamships_on_team_id"
    t.index ["user_id"], name: "index_user_teamships_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name",                   default: "", null: false
    t.string   "phone"
    t.string   "school"
    t.string   "major"
    t.string   "grade"
    t.date     "birth"
    t.text     "bio"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
