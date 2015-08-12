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

ActiveRecord::Schema.define(version: 20150812165214) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer  "creator_id",  null: false
    t.integer  "address_id",  null: false
    t.string   "title",       null: false
    t.text     "description", null: false
    t.string   "img_url",     null: false
    t.integer  "capacity",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "activities", ["creator_id", "title"], name: "index_activities_on_creator_id_and_title", unique: true, using: :btree
  add_index "activities", ["id"], name: "index_activities_on_id", using: :btree
  add_index "activities", ["title"], name: "index_activities_on_title", using: :btree

  create_table "addresses", force: :cascade do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "city",        null: false
    t.string   "state",       null: false
    t.string   "postal_code", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "author_id",   null: false
    t.integer  "num_stars",   null: false
    t.text     "body"
    t.integer  "activity_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "reviews", ["author_id", "activity_id"], name: "index_reviews_on_author_id_and_activity_id", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree

  add_foreign_key "reviews", "users", column: "author_id"
end
