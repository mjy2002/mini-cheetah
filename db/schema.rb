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

ActiveRecord::Schema.define(version: 2019_10_28_144343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "producers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_producers_on_name", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "barcode"
    t.integer "price_cents", default: 0
    t.uuid "sku"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "producer_id"
    t.string "image"
    t.index ["producer_id"], name: "index_products_on_producer_id"
    t.index ["sku"], name: "index_products_on_sku", unique: true
  end

  create_table "shopping_list_items", force: :cascade do |t|
    t.bigint "shopping_list_id"
    t.bigint "product_id"
    t.integer "quantity"
    t.bigint "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["position"], name: "index_shopping_list_items_on_position"
    t.index ["product_id"], name: "index_shopping_list_items_on_product_id"
    t.index ["shopping_list_id"], name: "index_shopping_list_items_on_shopping_list_id"
  end

  create_table "shopping_lists", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shopping_lists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "shopping_list_items", "products"
  add_foreign_key "shopping_list_items", "shopping_lists"
  add_foreign_key "shopping_lists", "users"
end
