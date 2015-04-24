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

ActiveRecord::Schema.define(version: 20150217131801) do

  create_table "exams", force: :cascade do |t|
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "group_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "exam_id"
  end

  create_table "scores", force: :cascade do |t|
    t.integer  "task_id"
    t.integer  "student_id"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: :cascade do |t|
    t.string   "student_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "task_number"
    t.string   "task_subnumber"
    t.string   "task_type"
    t.integer  "max_points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "exam_id"
  end

end