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

ActiveRecord::Schema.define(version: 2021_10_21_205748) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
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
    t.varchar "employee_id", limit: 50
    t.integer "role"
    t.string "deny_reason"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "response"
    t.integer "user_id"
    t.bigint "goal_id"
    t.bigint "proof_id"
    t.index ["course_id"], name: "index_approvals_on_course_id"
    t.index ["goal_id"], name: "index_approvals_on_goal_id"
    t.index ["proof_id"], name: "index_approvals_on_proof_id"
  end

  create_table "courses", force: :cascade do |t|
    t.varchar "employee_id", limit: 50
    t.datetime "start_date"
    t.datetime "end_date"
    t.varchar "course_title", limit: 200
    t.varchar "course_short", limit: 50
    t.integer "credit_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.bigint "user_id"
    t.bigint "goal_id"
    t.integer "cost_estimate_cents", default: 0, null: false
    t.varchar "cost_estimate_currency", limit: 50, default: "USD"
    t.index ["goal_id"], name: "index_courses_on_goal_id"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "credentials", force: :cascade do |t|
    t.varchar "name", limit: 50
    t.varchar "description", limit: 200
    t.boolean "auto_approve"
    t.bigint "degree_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["degree_id"], name: "index_credentials_on_degree_id"
  end

  create_table "degrees", force: :cascade do |t|
    t.varchar "name", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goals", force: :cascade do |t|
    t.varchar "focus", limit: 200
    t.boolean "active", default: true
    t.bigint "user_id"
    t.bigint "school_id"
    t.bigint "credential_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0, null: false
    t.index ["credential_id"], name: "index_goals_on_credential_id"
    t.index ["school_id"], name: "index_goals_on_school_id"
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "impressions", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "target_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "proofs", force: :cascade do |t|
    t.boolean "receipt"
    t.boolean "grade"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", null: false
    t.index ["course_id"], name: "index_proofs_on_course_id"
  end

  create_table "schools", force: :cascade do |t|
    t.integer "unitid", null: false
    t.varchar "opeid", limit: 50
    t.varchar "name", limit: 200
    t.varchar "city", limit: 200
    t.string "state", limit: 30
    t.boolean "operating", default: true
    t.varchar "aka", limit: 500
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.varchar "username", limit: 100
    t.varchar "displayname", limit: 200
    t.boolean "superuser", default: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.varchar "current_sign_in_ip", limit: 100
    t.varchar "last_sign_in_ip", limit: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.varchar "employee_id", limit: 50
    t.varchar "company", limit: 50
    t.boolean "manager_access"
    t.boolean "hr_access"
    t.varchar "email", limit: 200
    t.index ["username"], name: "index_users_on_username"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "approvals", "courses"
  add_foreign_key "approvals", "goals"
  add_foreign_key "approvals", "proofs"
  add_foreign_key "courses", "goals"
  add_foreign_key "courses", "users"
  add_foreign_key "credentials", "degrees"
  add_foreign_key "goals", "credentials"
  add_foreign_key "goals", "schools"
  add_foreign_key "goals", "users"
  add_foreign_key "impressions", "users"
  add_foreign_key "proofs", "courses"
end
