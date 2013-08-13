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

ActiveRecord::Schema.define(version: 20130813152104) do

  create_table "credentials", force: true do |t|
    t.string   "oauth_provider"
    t.string   "token"
    t.string   "refresh_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "identities", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source_file_name"
    t.string   "source_content_type"
    t.integer  "source_file_size"
    t.datetime "source_updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "to_user"
    t.string   "user_id"
    t.datetime "create_time",  limit: 8
    t.string   "message_type"
    t.text     "content"
    t.integer  "message_id",   limit: 8
    t.string   "picture_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "from_user",    limit: 8
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "password"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "display_name"
    t.string   "weixin_user_id"
    t.string   "avatar"
  end

end
