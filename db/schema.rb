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

ActiveRecord::Schema.define(version: 20131009200957) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.string   "link"
    t.text     "description"
    t.integer  "category_id"
    t.integer  "level_id"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "title"
    t.string   "cover"
    t.string   "author"
    t.text     "description"
    t.string   "isbn"
    t.integer  "category_id"
    t.integer  "level_id"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "sort_index"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
  end

  create_table "languages", force: true do |t|
    t.string   "name"
    t.string   "short_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "levels", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "video_links", force: true do |t|
    t.string   "url"
    t.integer  "video_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", force: true do |t|
    t.string   "title"
    t.string   "head_video"
    t.integer  "category_id"
    t.integer  "level_id"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
