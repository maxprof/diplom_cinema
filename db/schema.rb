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

ActiveRecord::Schema.define(version: 20160524175053) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cinemas", force: :cascade do |t|
    t.string   "cinema_name"
    t.string   "cinema_addr"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "film_session_categories", force: :cascade do |t|
    t.integer "film_session_id"
    t.integer "category_id"
  end

  create_table "film_session_session_times", force: :cascade do |t|
    t.integer "film_session_id"
    t.integer "session_time_id"
  end

  create_table "film_sessions", force: :cascade do |t|
    t.integer  "cinema_id"
    t.string   "session_name"
    t.integer  "number_of_session_place"
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.integer  "user_id"
    t.string   "session_start_date"
    t.text     "description"
    t.float    "rating"
    t.string   "trailer_link"
    t.string   "film_sessions_poster_file_name"
    t.string   "film_sessions_poster_content_type"
    t.integer  "film_sessions_poster_file_size"
    t.datetime "film_sessions_poster_updated_at"
    t.decimal  "price",                             precision: 8, scale: 2
    t.string   "session_end_date"
  end

  create_table "film_sessions_places", id: false, force: :cascade do |t|
    t.integer "film_session_id"
    t.integer "place_id"
  end

  add_index "film_sessions_places", ["film_session_id"], name: "index_film_sessions_places_on_film_session_id"
  add_index "film_sessions_places", ["place_id"], name: "index_film_sessions_places_on_place_id"

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "news_poster_file_name"
    t.string   "news_poster_content_type"
    t.integer  "news_poster_file_size"
    t.datetime "news_poster_updated_at"
  end

  create_table "places", force: :cascade do |t|
    t.integer  "cinema_id"
    t.integer  "film_session_id"
    t.integer  "place_number"
    t.boolean  "status"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.string   "session_start_date"
    t.string   "session_time"
    t.string   "session_date"
  end

  create_table "session_times", force: :cascade do |t|
    t.string   "session_time"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
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
    t.string   "provider"
    t.string   "uid"
    t.boolean  "admin"
    t.string   "default"
    t.string   "false"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "login"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
