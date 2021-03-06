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

ActiveRecord::Schema.define(version: 20180413001630) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "instagrams", force: :cascade do |t|
    t.string "handle"
    t.integer "posts"
    t.integer "followers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subreddits", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "subscribers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "twitters", force: :cascade do |t|
    t.string "handle"
    t.integer "followers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.date "joined"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "twitter_id"
    t.bigint "instagram_id"
    t.bigint "subreddit_id"
    t.bigint "user_id"
    t.index ["instagram_id"], name: "index_votes_on_instagram_id"
    t.index ["subreddit_id"], name: "index_votes_on_subreddit_id"
    t.index ["twitter_id"], name: "index_votes_on_twitter_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  create_table "works", force: :cascade do |t|
    t.string "type"
    t.string "handle"
    t.integer "followers"
    t.integer "posts"
    t.string "title"
    t.string "description"
    t.integer "subscribers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "votes", "instagrams"
  add_foreign_key "votes", "subreddits"
  add_foreign_key "votes", "twitters"
  add_foreign_key "votes", "users"
end
