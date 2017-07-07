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

ActiveRecord::Schema.define(version: 20161027080433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "category_title"
    t.text     "category_description"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "courses", force: :cascade do |t|
    t.integer  "topic_id"
    t.string   "course_title"
    t.text     "course_description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "courses", ["topic_id"], name: "index_courses_on_topic_id", using: :btree

  create_table "empl_cities", force: :cascade do |t|
    t.integer  "empl_state_id"
    t.string   "city_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "empl_cities", ["empl_state_id"], name: "index_empl_cities_on_empl_state_id", using: :btree

  create_table "empl_designations", force: :cascade do |t|
    t.string   "designation_title"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "empl_educations", force: :cascade do |t|
    t.string   "education_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "empl_job_types", force: :cascade do |t|
    t.string   "job_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "empl_jobs", force: :cascade do |t|
    t.integer  "empl_designation_id"
    t.integer  "empl_organisation_id"
    t.integer  "empl_city_id"
    t.integer  "empl_job_type_id"
    t.integer  "empl_education_id"
    t.integer  "number_of_positions"
    t.string   "job_type_detail"
    t.text     "notification_summary"
    t.date     "announcemnet_date"
    t.date     "start_application_date"
    t.date     "last_application_date"
    t.text     "salary_information"
    t.string   "monthly_salary"
    t.boolean  "salary_negotiable"
    t.text     "application_procedure"
    t.boolean  "written_test"
    t.boolean  "interview"
    t.boolean  "online_test"
    t.boolean  "language_test"
    t.boolean  "physical_test"
    t.boolean  "medical_test"
    t.text     "selection_procedure_information"
    t.string   "gender"
    t.string   "age"
    t.text     "qualification"
    t.text     "physical_requirement"
    t.text     "experience_information"
    t.boolean  "need_experience"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "empl_jobs", ["empl_city_id"], name: "index_empl_jobs_on_empl_city_id", using: :btree
  add_index "empl_jobs", ["empl_designation_id"], name: "index_empl_jobs_on_empl_designation_id", using: :btree
  add_index "empl_jobs", ["empl_education_id"], name: "index_empl_jobs_on_empl_education_id", using: :btree
  add_index "empl_jobs", ["empl_job_type_id"], name: "index_empl_jobs_on_empl_job_type_id", using: :btree
  add_index "empl_jobs", ["empl_organisation_id"], name: "index_empl_jobs_on_empl_organisation_id", using: :btree

  create_table "empl_organisations", force: :cascade do |t|
    t.string   "organisation_name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "empl_states", force: :cascade do |t|
    t.string   "state_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "topic_title"
    t.text     "topic_description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "topics", ["category_id"], name: "index_topics_on_category_id", using: :btree

  add_foreign_key "courses", "topics"
  add_foreign_key "empl_cities", "empl_states"
  add_foreign_key "empl_jobs", "empl_cities"
  add_foreign_key "empl_jobs", "empl_designations"
  add_foreign_key "empl_jobs", "empl_educations"
  add_foreign_key "empl_jobs", "empl_job_types"
  add_foreign_key "empl_jobs", "empl_organisations"
  add_foreign_key "topics", "categories"
end
