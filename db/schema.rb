# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_18_164351) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer "authorid"
    t.integer "postid"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["authorid"], name: "index_comments_on_authorid"
    t.index ["postid"], name: "index_comments_on_postid"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "authorid"
    t.integer "postid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["authorid"], name: "index_likes_on_authorid"
    t.index ["postid"], name: "index_likes_on_postid"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "authorid"
    t.string "title"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "commentscounter"
    t.integer "likescounter"
    t.index ["authorid"], name: "index_posts_on_authorid"
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "photo"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "postscounter"
    t.index ["name"], name: "index_users_on_name"
  end

  add_foreign_key "comments", "posts", column: "postid"
  add_foreign_key "comments", "users", column: "authorid"
  add_foreign_key "likes", "users", column: "authorid"
  add_foreign_key "posts", "likes", column: "likescounter"
  add_foreign_key "posts", "users", column: "authorid"
end