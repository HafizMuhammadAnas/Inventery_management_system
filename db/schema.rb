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

ActiveRecord::Schema.define(version: 2022_12_20_141236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "order_id"
    t.integer "qty"
    t.decimal "price", precision: 10, scale: 2
    t.decimal "discount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "total", precision: 10, scale: 2
    t.index ["order_id"], name: "index_items_on_order_id"
    t.index ["product_id"], name: "index_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "order_code"
    t.datetime "order_date"
    t.integer "status"
    t.decimal "total", precision: 10, scale: 2
    t.decimal "discount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "tax", precision: 10, scale: 2
    t.decimal "grand_total", precision: 10, scale: 2
    t.integer "user_id"
    t.index ["order_code"], name: "index_orders_on_order_code", unique: true
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "order_id"
    t.datetime "payment_date"
    t.decimal "amount", precision: 10, scale: 2
    t.decimal "change_amount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "sku"
    t.string "name"
    t.string "slug"
    t.decimal "price", precision: 10, scale: 2
    t.text "description"
    t.integer "status"
    t.integer "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "product_image_file_name"
    t.string "product_image_content_type"
    t.integer "product_image_file_size"
    t.datetime "product_image_updated_at"
    t.index ["name"], name: "index_products_on_name", unique: true
    t.index ["sku"], name: "index_products_on_sku", unique: true
    t.index ["slug"], name: "index_products_on_slug", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "address"
    t.string "role"
    t.string "contect_number"
    t.string "branch_name"
    t.string "image"
    t.string "user_image_file_name"
    t.string "user_image_content_type"
    t.integer "user_image_file_size"
    t.datetime "user_image_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "items", "orders"
  add_foreign_key "items", "products"
  add_foreign_key "payments", "orders"
end
