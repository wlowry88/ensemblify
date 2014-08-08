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

ActiveRecord::Schema.define(version: 20140807012019) do

  create_table "group_pieces", force: true do |t|
    t.integer  "group_id"
    t.integer  "piece_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_pieces", ["group_id"], name: "index_group_pieces_on_group_id"
  add_index "group_pieces", ["piece_id"], name: "index_group_pieces_on_piece_id"

  create_table "groups", force: true do |t|
    t.string   "name"
    t.integer  "instrumentation_id"
    t.boolean  "complete",           default: false
    t.integer  "admin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "zipcode"
  end

  add_index "groups", ["instrumentation_id"], name: "index_groups_on_instrumentation_id"

  create_table "instrument_instrumentations", force: true do |t|
    t.integer  "instrument_id"
    t.integer  "instrumentation_id"
    t.integer  "quantity",           default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "instrument_instrumentations", ["instrument_id"], name: "index_instrument_instrumentations_on_instrument_id"
  add_index "instrument_instrumentations", ["instrumentation_id"], name: "index_instrument_instrumentations_on_instrumentation_id"

  create_table "instrumentations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instruments", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interests", force: true do |t|
    t.integer  "user_id"
    t.integer  "instrumentation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "interests", ["instrumentation_id"], name: "index_interests_on_instrumentation_id"
  add_index "interests", ["user_id"], name: "index_interests_on_user_id"

  create_table "pieces", force: true do |t|
    t.string   "name"
    t.integer  "level"
    t.integer  "instrumentation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pieces", ["instrumentation_id"], name: "index_pieces_on_instrumentation_id"

  create_table "requests", force: true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.boolean  "user_approved"
    t.boolean  "group_approved"
    t.boolean  "finalized"
    t.string   "part"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "requests", ["group_id"], name: "index_requests_on_group_id"
  add_index "requests", ["user_id"], name: "index_requests_on_user_id"

  create_table "users", force: true do |t|
    t.string   "uid"
    t.string   "provider"
    t.string   "oauth_token"
    t.string   "oauth_expires_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "instrument_id"
    t.string   "gender"
    t.text     "short_bio",        default: ""
    t.string   "image"
    t.string   "email"
    t.string   "zipcode"
    t.string   "phone_number"
    t.string   "level"
    t.string   "video_sample",     default: ""
    t.string   "audio_sample",     default: ""
    t.string   "available",        default: "seeking a group"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "users", ["instrument_id"], name: "index_users_on_instrument_id"

end
