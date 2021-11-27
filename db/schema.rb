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

ActiveRecord::Schema.define(version: 2021_11_26_150216) do

  create_table "bills", charset: "utf8", force: :cascade do |t|
    t.integer "prev_reading"
    t.integer "curr_reading"
    t.integer "units"
    t.float "amount"
    t.string "status"
    t.bigint "connection_id", null: false
    t.bigint "official_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image_url"
    t.index ["connection_id"], name: "index_bills_on_connection_id"
    t.index ["official_id"], name: "index_bills_on_official_id"
  end

  create_table "connections", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "connection_type"
    t.integer "phase"
    t.float "rate"
    t.string "area"
    t.bigint "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_connections_on_customer_id"
  end

  create_table "customers", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.string "mobileno"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "grievances", charset: "utf8", force: :cascade do |t|
    t.string "problem"
    t.string "description"
    t.string "remarks"
    t.string "status"
    t.bigint "connection_id", null: false
    t.bigint "official_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["connection_id"], name: "index_grievances_on_connection_id"
    t.index ["official_id"], name: "index_grievances_on_official_id"
  end

  create_table "officials", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.string "area"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "connections", "customers"
  add_foreign_key "grievances", "connections"
  add_foreign_key "grievances", "officials"
end
