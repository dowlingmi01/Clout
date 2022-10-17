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

ActiveRecord::Schema[7.0].define(version: 2022_10_17_183112) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "completions", force: :cascade do |t|
    t.bigint "survey_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_completions_on_survey_id"
    t.index ["user_id"], name: "index_completions_on_user_id"
  end

  create_table "enrollments", force: :cascade do |t|
    t.bigint "survey_id", null: false
    t.bigint "user_id", null: false
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_enrollments_on_survey_id"
    t.index ["user_id"], name: "index_enrollments_on_user_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "survey_id", null: false
    t.integer "experience_amount"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_experiences_on_survey_id"
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "age"
    t.string "gender"
    t.string "ethnicity"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "rewards_cashes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "survey_id", null: false
    t.decimal "rewards_cash_amount"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_rewards_cashes_on_survey_id"
    t.index ["user_id"], name: "index_rewards_cashes_on_user_id"
  end

  create_table "survey_rewards", force: :cascade do |t|
    t.bigint "survey_id"
    t.bigint "user_id"
    t.datetime "rewarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "survey_reward_amount"
    t.index ["survey_id"], name: "index_survey_rewards_on_survey_id"
    t.index ["user_id"], name: "index_survey_rewards_on_user_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "survey_name"
    t.text "description"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.decimal "cpi"
    t.integer "incidence"
    t.integer "loi"
    t.integer "category_id"
    t.decimal "rewards_cash"
    t.integer "experience"
    t.decimal "survey_reward"
    t.index ["category_id"], name: "index_surveys_on_category_id"
    t.index ["user_id"], name: "index_surveys_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "completions", "surveys"
  add_foreign_key "completions", "users"
  add_foreign_key "enrollments", "surveys"
  add_foreign_key "enrollments", "users"
  add_foreign_key "experiences", "surveys"
  add_foreign_key "experiences", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "rewards_cashes", "surveys"
  add_foreign_key "rewards_cashes", "users"
  add_foreign_key "surveys", "users"
end
