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

ActiveRecord::Schema.define(version: 2021_12_03_102039) do

  create_table "active_storage_attachments", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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
    t.string "employee_id"
    t.string "emp_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "connections", "customers"
  add_foreign_key "grievances", "connections"
  add_foreign_key "grievances", "officials"
end
