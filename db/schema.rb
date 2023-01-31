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

ActiveRecord::Schema[7.0].define(version: 2023_01_31_122655) do
  create_table "appointments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "students", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "student_id"
    t.string "firstname"
    t.string "lastname"
    t.date "dob"
    t.string "gender"
    t.string "department"
    t.string "phone"
    t.string "street"
    t.string "city"
    t.string "province"
    t.string "zipcode"
    t.string "ec_firstname"
    t.string "ec_lastname"
    t.string "ec_mobile"
    t.string "ec_relationship"
    t.integer "height"
    t.integer "weight"
    t.integer "bmi"
    t.string "bmi_interpretation"
    t.string "blood_type"
    t.string "hand_type"
    t.string "food_allergies"
    t.string "drug_allergies"
    t.string "smoke"
    t.integer "stick_count"
    t.string "smoke_duration"
    t.string "alcohol"
    t.integer "alcohol_count"
    t.string "drug_history"
    t.string "herbal_meds"
    t.string "blood_transfusion"
    t.string "artificial_body"
    t.string "dentures"
    t.string "corrective"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "users"
end
