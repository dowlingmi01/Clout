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

ActiveRecord::Schema[7.0].define(version: 2022_11_22_170254) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "completions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "completion_source_type"
    t.bigint "completion_source_id"
    t.index ["completion_source_type", "completion_source_id"], name: "index_completions_on_completion_source"
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
    t.integer "experience_amount"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "experience_source_type"
    t.bigint "experience_source_id"
    t.index ["experience_source_type", "experience_source_id"], name: "index_experiences_on_experience_source"
    t.index ["user_id"], name: "index_experiences_on_user_id"
  end

  create_table "polls", force: :cascade do |t|
    t.integer "experience"
    t.decimal "rewards_cash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
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

  create_table "questions", force: :cascade do |t|
    t.bigint "poll_id"
    t.text "topic"
    t.text "comment"
    t.string "option_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.index ["poll_id"], name: "index_questions_on_poll_id"
  end

  create_table "rewards_cashes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.decimal "rewards_cash_amount"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rewards_cash_source_type"
    t.bigint "rewards_cash_source_id"
    t.index ["rewards_cash_source_type", "rewards_cash_source_id"], name: "index_rewards_cashes_on_rewards_cash_source"
    t.index ["user_id"], name: "index_rewards_cashes_on_user_id"
  end

  create_table "survey_rewards", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "rewarded_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "survey_reward_amount"
    t.string "survey_reward_source_type"
    t.bigint "survey_reward_source_id"
    t.index ["survey_reward_source_type", "survey_reward_source_id"], name: "index_survey_rewards_on_survey_reward_source"
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

  create_table "vote_options", force: :cascade do |t|
    t.string "title"
    t.bigint "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_vote_options_on_question_id"
  end

  create_table "vote_options_votes", id: false, force: :cascade do |t|
    t.bigint "vote_option_id", null: false
    t.bigint "vote_id", null: false
    t.index ["vote_option_id", "vote_id"], name: "index_vote_options_votes_on_vote_option_id_and_vote_id"
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "completions", "users"
  add_foreign_key "enrollments", "surveys"
  add_foreign_key "enrollments", "users"
  add_foreign_key "experiences", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "rewards_cashes", "users"
  add_foreign_key "surveys", "users"
  add_foreign_key "vote_options", "questions", on_delete: :cascade
  add_foreign_key "votes", "users"
end
