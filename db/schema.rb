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

ActiveRecord::Schema.define(version: 20161003145816) do

  create_table "admin_lists", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_lists_on_email", unique: true
  end

  create_table "assignments", force: :cascade do |t|
    t.integer  "task_id"
    t.datetime "deadline"
    t.datetime "assigned_at"
    t.boolean  "team_work",   default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "group_id"
    t.integer  "stage_id"
    t.integer  "num"
    t.index ["task_id"], name: "index_assignments_on_task_id"
  end

  create_table "attendances", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "lesson_id"
    t.boolean  "attend"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id"
    t.index ["lesson_id"], name: "index_attendances_on_lesson_id"
    t.index ["project_id"], name: "index_attendances_on_project_id"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_groups_on_name", unique: true
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "name"
    t.integer  "stage_id"
    t.integer  "group_id"
    t.datetime "published_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "num"
    t.index ["group_id"], name: "index_lessons_on_group_id"
    t.index ["num"], name: "index_lessons_on_num"
    t.index ["stage_id"], name: "index_lessons_on_stage_id"
  end

  create_table "parti_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_parti_statuses_on_name", unique: true
  end

  create_table "participations", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "status_id",  default: 1
    t.index ["group_id"], name: "index_participations_on_group_id"
    t.index ["project_id", "user_id"], name: "index_participations_on_project_id_and_user_id", unique: true
    t.index ["project_id"], name: "index_participations_on_project_id"
    t.index ["status_id"], name: "index_participations_on_status_id"
    t.index ["user_id"], name: "index_participations_on_user_id"
  end

  create_table "proj_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_proj_categories_on_name", unique: true
  end

  create_table "proj_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_proj_statuses_on_name", unique: true
  end

  create_table "project_groupships", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_project_groupships_on_group_id"
    t.index ["project_id", "group_id"], name: "index_project_groupships_on_project_id_and_group_id", unique: true
    t.index ["project_id"], name: "index_project_groupships_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "info"
    t.date     "start_on"
    t.date     "close_on"
    t.integer  "creator_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "category_id", default: 1
    t.integer  "status_id",   default: 3
    t.index ["category_id"], name: "index_projects_on_category_id"
    t.index ["name"], name: "index_projects_on_name", unique: true
    t.index ["status_id"], name: "index_projects_on_status_id"
  end

  create_table "stage_executions", force: :cascade do |t|
    t.string   "name"
    t.integer  "stage_id"
    t.integer  "group_id"
    t.datetime "published_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["group_id"], name: "index_stage_executions_on_group_id"
    t.index ["stage_id"], name: "index_stage_executions_on_stage_id"
  end

  create_table "stages", force: :cascade do |t|
    t.integer  "num"
    t.text     "info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id"
    t.index ["num"], name: "index_stages_on_num"
    t.index ["project_id"], name: "index_stages_on_project_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "num"
    t.string   "name"
    t.boolean  "team_work",  default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "project_id"
    t.index ["num"], name: "index_tasks_on_num"
    t.index ["project_id"], name: "index_tasks_on_project_id"
  end

  create_table "teammateships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.boolean  "active",     default: true
    t.date     "quit_on"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["team_id"], name: "index_teammateships_on_team_id"
    t.index ["user_id"], name: "index_teammateships_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer  "num"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "group_id"
    t.index ["group_id"], name: "index_teams_on_group_id"
    t.index ["project_id"], name: "index_teams_on_project_id"
  end

  create_table "uploads", force: :cascade do |t|
    t.integer  "task_id"
    t.integer  "user_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.integer  "assignment_id"
    t.integer  "team_id"
    t.integer  "group_id"
    t.integer  "stage_id"
    t.boolean  "on_time"
    t.integer  "upload_count",          default: 1
    t.index ["task_id"], name: "index_uploads_on_task_id"
    t.index ["user_id"], name: "index_uploads_on_user_id"
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
    t.string   "phone",                  default: "", null: false
    t.string   "school"
    t.string   "major"
    t.string   "grade"
    t.date     "birth"
    t.text     "bio"
    t.integer  "created_by"
    t.date     "first_login_on"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone"], name: "index_users_on_phone"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
