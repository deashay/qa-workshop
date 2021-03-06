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

ActiveRecord::Schema.define(version: 20150821173404) do

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["name", "resource_type", "resource_id"], name: "index_admins_on_name_and_resource_type_and_resource_id"
  add_index "admins", ["name"], name: "index_admins_on_name"

  create_table "book_categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "books", force: :cascade do |t|
    t.string  "author"
    t.string  "title"
    t.text    "description"
    t.string  "cover"
    t.string  "publishing_house"
    t.date    "published_at"
    t.integer "quantity",          default: 1
    t.integer "book_category_id"
    t.integer "borrowed_quantity", default: 0
  end

  add_index "books", ["book_category_id"], name: "index_books_on_book_category_id"

  create_table "books_carts", id: false, force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "cart_id", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id"
  end

  add_index "carts", ["user_id"], name: "index_carts_on_user_id"

  create_table "contact_requests", force: :cascade do |t|
    t.text "text"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "user_id"
    t.string   "state",      default: "awaiting_collection"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "returned",   default: false
  end

  add_index "orders", ["cart_id"], name: "index_orders_on_cart_id"
  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_admins", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "admin_id"
  end

  add_index "users_admins", ["user_id", "admin_id"], name: "index_users_admins_on_user_id_and_admin_id"

end
