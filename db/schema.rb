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

ActiveRecord::Schema.define(version: 20140404001934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "link_subs", force: true do |t|
    t.integer  "link_id"
    t.integer  "sub_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", force: true do |t|
    t.string   "url"
    t.string   "title"
    t.string   "text"
    t.integer  "sub_id"
    t.integer  "poster_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subs", force: true do |t|
    t.string   "title"
    t.integer  "mod_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
