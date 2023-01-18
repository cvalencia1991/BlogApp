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

ActiveRecord::Schema[7.0].define(version: 2023_01_17_152610) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comment", force: :cascade do |t|
    t.integer "authoid"
    t.integer "postid"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["authoid"], name: "index_comment_on_authoid"
    t.index ["postid"], name: "index_comment_on_postid"
  end

  create_table "like", force: :cascade do |t|
    t.integer "authoid"
    t.integer "postid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["authoid"], name: "index_like_on_authoid"
  end

  create_table "post", force: :cascade do |t|
    t.integer "authorid"
    t.integer "commentsCounter"
    t.integer "likesCounter"
    t.string "title"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["authorid"], name: "index_post_on_authorid"
  end

  create_table "user", force: :cascade do |t|
    t.text "name"
    t.text "photo"
    t.text "bio"
    t.integer "postscounter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_user_on_name"
  end

  add_foreign_key "post", "\"like\"", column: "authorid"
  add_foreign_key "user", "post", column: "postscounter"
end
