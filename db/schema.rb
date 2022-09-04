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

ActiveRecord::Schema.define(version: 2022_09_04_095601) do

  create_table "blogs", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.datetime "published_at"
    t.integer "stock_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stock_id"], name: "index_blogs_on_stock_id"
  end

  create_table "email_list_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "email_list_id"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_list_id"], name: "index_email_list_users_on_email_list_id"
    t.index ["user_id"], name: "index_email_list_users_on_user_id"
  end

  create_table "email_lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "newsletter_items", force: :cascade do |t|
    t.string "display"
    t.integer "newsletter_id"
    t.string "target_type"
    t.integer "target_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["newsletter_id"], name: "index_newsletter_items_on_newsletter_id"
    t.index ["target_type", "target_id"], name: "index_newsletter_items_on_target_type_and_target_id"
  end

  create_table "newsletters", force: :cascade do |t|
    t.string "subject"
    t.string "description"
    t.integer "email_list_id"
    t.datetime "published_at"
    t.datetime "delivered_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_list_id"], name: "index_newsletters_on_email_list_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "name"
    t.string "price"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
