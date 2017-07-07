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

ActiveRecord::Schema.define(version: 20160902111901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advanced_categories", force: :cascade do |t|
    t.integer  "intermediate_category_id"
    t.string   "advanced_cat_title"
    t.text     "advanced_cat_description"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "advanced_categories", ["intermediate_category_id"], name: "index_advanced_categories_on_intermediate_category_id", using: :btree

  create_table "basic_categories", force: :cascade do |t|
    t.string   "basic_cat_title"
    t.text     "basic_cat_description"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "company_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "exam_intermediate_categories", force: :cascade do |t|
    t.integer  "exam_main_category_id"
    t.string   "exam_intermediate_cat_name"
    t.text     "exam_intermediate_cat_description"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "exam_intermediate_categories", ["exam_main_category_id"], name: "index_exam_intermediate_categories_on_exam_main_category_id", using: :btree

  create_table "exam_main_categories", force: :cascade do |t|
    t.string   "exam_main_cat_name"
    t.text     "exam_main_cat_description"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "intermediate_categories", force: :cascade do |t|
    t.integer  "basic_category_id"
    t.string   "intermediate_cat_title"
    t.text     "intermediate_cat_description"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "intermediate_categories", ["basic_category_id"], name: "index_intermediate_categories_on_basic_category_id", using: :btree

  create_table "papers", force: :cascade do |t|
    t.integer  "exam_intermediate_category_id"
    t.integer  "company_id"
    t.string   "paper_name"
    t.integer  "duration"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "papers", ["company_id"], name: "index_papers_on_company_id", using: :btree
  add_index "papers", ["exam_intermediate_category_id"], name: "index_papers_on_exam_intermediate_category_id", using: :btree

  create_table "playlists", force: :cascade do |t|
    t.integer  "advanced_category_id"
    t.integer  "user_id"
    t.string   "playlist_title",       null: false
    t.text     "playlist_description", null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "playlists", ["advanced_category_id"], name: "index_playlists_on_advanced_category_id", using: :btree
  add_index "playlists", ["user_id"], name: "index_playlists_on_user_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.integer  "paper_id"
    t.text     "question"
    t.string   "option_a"
    t.string   "option_b"
    t.string   "option_c"
    t.string   "option_d"
    t.text     "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "questions", ["paper_id"], name: "index_questions_on_paper_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",                   null: false
    t.string   "uid",                        null: false
    t.string   "name",                       null: false
    t.string   "email",                      null: false
    t.boolean  "tutor",      default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "videos", force: :cascade do |t|
    t.integer  "playlist_id"
    t.string   "video_title",        null: false
    t.text     "video_description",  null: false
    t.string   "keywords",           null: false
    t.string   "video_url",          null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "videos", ["playlist_id"], name: "index_videos_on_playlist_id", using: :btree

  add_foreign_key "advanced_categories", "intermediate_categories"
  add_foreign_key "exam_intermediate_categories", "exam_main_categories"
  add_foreign_key "intermediate_categories", "basic_categories"
  add_foreign_key "papers", "companies"
  add_foreign_key "papers", "exam_intermediate_categories"
  add_foreign_key "playlists", "advanced_categories"
  add_foreign_key "playlists", "users"
  add_foreign_key "questions", "papers"
  add_foreign_key "videos", "playlists"
end
