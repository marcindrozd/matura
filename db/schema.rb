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

ActiveRecord::Schema.define(version: 20150801122756) do

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

  create_table "scores", force: :cascade do |t|
    t.integer  "task_id"
    t.integer  "student_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "number"
    t.string   "subnumber"
    t.string   "level"
    t.integer  "max_points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "exam_id"
    t.integer  "skill_id"
  end

  add_index "tasks", ["exam_id"], name: "index_tasks_on_exam_id", using: :btree
  add_index "tasks", ["skill_id"], name: "index_tasks_on_skill_id", using: :btree

end
