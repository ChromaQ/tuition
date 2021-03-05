# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_04_003512) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_data", force: :cascade do |t|
    t.string "key", null: false
    t.binary "io", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_active_storage_data_on_key"
  end

  create_table "approvals", force: :cascade do |t|
    t.integer "course_id"
    t.string "employee_id"
    t.integer "role"
    t.text "deny_reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "response"
    t.integer "user_id"
    t.index ["course_id"], name: "index_approvals_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "employee_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "course_title"
    t.string "course_short"
    t.integer "credit_hours"
    t.float "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.integer "user_id"
    t.integer "credential_id"
    t.index ["credential_id"], name: "index_courses_on_credential_id"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "credentials", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "auto_approve"
    t.integer "degree_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["degree_id"], name: "index_credentials_on_degree_id"
  end

  create_table "degrees", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "impressions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "target_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "proofs", force: :cascade do |t|
    t.boolean "receipt"
    t.boolean "grade"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "approver_id"
    t.integer "response"
    t.string "deny_reason"
    t.index ["approver_id"], name: "index_proofs_on_approver_id"
    t.index ["course_id"], name: "index_proofs_on_course_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "displayname"
    t.boolean "superuser", default: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "employee_id"
    t.string "company"
    t.boolean "manager_access"
    t.boolean "hr_access"
    t.string "email"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "impressions", "users"
  add_foreign_key "proofs", "courses"
  add_foreign_key "proofs", "users", column: "approver_id"
end
