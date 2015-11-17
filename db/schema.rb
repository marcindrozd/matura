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

ActiveRecord::Schema.define(version: 20151117163140) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "exam_id"
  end

  add_index "groups", ["exam_id"], name: "index_groups_on_exam_id", using: :btree

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
  end

  create_table "scores", force: :cascade do |t|
    t.integer  "subtask_id"
    t.integer  "student_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "level"
  end

  create_table "subtasks", force: :cascade do |t|
    t.integer  "max_points"
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number"
    t.string   "description"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "number"
    t.string   "level"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "exam_id"
    t.string   "skill"
    t.integer  "secondary_number"
    t.string   "description"
  end

  add_index "tasks", ["exam_id"], name: "index_tasks_on_exam_id", using: :btree

  create_table "user_filters", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "activated_at"
    t.string   "filter_key"
    t.text     "filter_hash"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_filters", ["user_id"], name: "index_user_filters_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "role"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
