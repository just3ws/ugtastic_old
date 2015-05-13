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

ActiveRecord::Schema.define(version: 20150513031627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "fuzzystrmatch"
  enable_extension "pg_trgm"
  enable_extension "uuid-ossp"

  create_table "conferences", force: :cascade do |t|
    t.string   "name"
    t.integer  "year"
    t.string   "homepage"
    t.string   "venue"
    t.string   "city"
    t.string   "country"
    t.text     "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "slug"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "interviewees", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  add_index "interviewees", ["slug"], name: "index_interviewees_on_slug", unique: true, using: :btree

  create_table "metrics", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "session_id"
    t.string   "request_action"
    t.string   "request_controller"
    t.string   "request_ip"
    t.string   "request_method"
    t.string   "request_referrer"
    t.string   "request_requestor_ip"
    t.string   "request_url"
    t.string   "request_user_agent"
    t.string   "request_xff"
    t.uuid     "user_id"
    t.jsonb    "request_params"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "transcripts", force: :cascade do |t|
    t.string   "locale"
    t.integer  "video_id"
    t.text     "text"
    t.integer  "format",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "role"
  end

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id"
    t.string  "foreign_key_name", null: false
    t.integer "foreign_key_id"
  end

  add_index "version_associations", ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key", using: :btree
  add_index "version_associations", ["version_id"], name: "index_version_associations_on_version_id", using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      null: false
    t.integer  "item_id",        null: false
    t.string   "event",          null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.integer  "transaction_id"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  add_index "versions", ["transaction_id"], name: "index_versions_on_transaction_id", using: :btree

  create_table "video_interviewees", force: :cascade do |t|
    t.integer  "video_id"
    t.integer  "interviewee_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "you_tube_playlist_videos", force: :cascade do |t|
    t.integer  "playlist_id", null: false
    t.integer  "video_id",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "you_tube_playlist_videos", ["playlist_id"], name: "index_you_tube_playlist_videos_on_playlist_id", using: :btree
  add_index "you_tube_playlist_videos", ["video_id", "playlist_id"], name: "index_you_tube_playlist_videos_on_video_id_and_playlist_id", using: :btree
  add_index "you_tube_playlist_videos", ["video_id"], name: "index_you_tube_playlist_videos_on_video_id", using: :btree

  create_table "you_tube_playlists", force: :cascade do |t|
    t.string   "remote_playlist_id",                 null: false
    t.json     "cache"
    t.string   "etag",                               null: false
    t.string   "title",                              null: false
    t.text     "description"
    t.string   "state",              default: "new"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "you_tube_videos", force: :cascade do |t|
    t.string   "remote_video_id",                 null: false
    t.json     "cache"
    t.string   "etag",                            null: false
    t.string   "title",                           null: false
    t.text     "description"
    t.string   "state",           default: "new"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "slug"
    t.string   "context"
    t.string   "subtitle"
    t.integer  "status",          default: 0,     null: false
    t.integer  "conference_id"
  end

  add_index "you_tube_videos", ["slug"], name: "index_you_tube_videos_on_slug", unique: true, using: :btree

end
