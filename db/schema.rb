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

ActiveRecord::Schema.define(version: 20150925195957) do

  create_table "api_tokens", force: :cascade do |t|
    t.string   "token"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "api_tokens", ["user_id"], name: "index_api_tokens_on_user_id"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id"

  create_table "contacts", force: :cascade do |t|
    t.integer  "topic_id"
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contacts", ["topic_id"], name: "index_contacts_on_topic_id"

  create_table "dancers", force: :cascade do |t|
    t.string   "username"
    t.string   "gender"
    t.string   "age_range"
    t.string   "facebook_token"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "dancers", ["facebook_token"], name: "index_dancers_on_facebook_token"
  add_index "dancers", ["user_id"], name: "index_dancers_on_user_id"

  create_table "likes", force: :cascade do |t|
    t.integer "dancer_id"
    t.integer "venue_id"
  end

  add_index "likes", ["dancer_id"], name: "index_likes_on_dancer_id"
  add_index "likes", ["venue_id"], name: "index_likes_on_venue_id"

  create_table "parties", force: :cascade do |t|
    t.string   "img_url"
    t.string   "name"
    t.string   "party_type"
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "cover"
    t.text     "description"
    t.string   "status"
    t.integer  "venue_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "parties", ["venue_id"], name: "index_parties_on_venue_id"

  create_table "recent_searches", force: :cascade do |t|
    t.integer "user_id"
    t.integer "venue_id"
  end

  add_index "recent_searches", ["user_id"], name: "index_recent_searches_on_user_id"
  add_index "recent_searches", ["venue_id"], name: "index_recent_searches_on_venue_id"

  create_table "states", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topics", force: :cascade do |t|
    t.string   "title"
    t.integer  "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "topics", ["contact_id"], name: "index_topics_on_contact_id"

  create_table "users", force: :cascade do |t|
    t.string   "user_type"
    t.string   "avatar_url"
    t.boolean  "verified"
    t.boolean  "wants_newsletter"
    t.integer  "dancer_id"
    t.integer  "venue_id"
    t.string   "authentication_token"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token"
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["provider"], name: "index_users_on_provider"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid"], name: "index_users_on_uid"

  create_table "venue_photos", force: :cascade do |t|
    t.integer  "venue_id"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "venue_photos", ["venue_id"], name: "index_venue_photos_on_venue_id"

  create_table "venue_ratings", force: :cascade do |t|
    t.integer  "dancer_id"
    t.integer  "venue_id"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "venue_ratings", ["dancer_id"], name: "index_venue_ratings_on_dancer_id"
  add_index "venue_ratings", ["venue_id"], name: "index_venue_ratings_on_venue_id"

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "street_address"
    t.string   "venue_type"
    t.string   "dresscode"
    t.string   "popular_drink"
    t.string   "best_for"
    t.string   "url"
    t.string   "music_genre"
    t.boolean  "live"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "venues", ["user_id"], name: "index_venues_on_user_id"

end
