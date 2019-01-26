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

ActiveRecord::Schema.define(version: 2019_01_22_160242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "question_answers", force: :cascade do |t|
    t.text "answer_text"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_answers_on_question_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.text "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "options", default: {}
  end

  create_table "questions", force: :cascade do |t|
    t.text "question_text"
    t.integer "correct_answer"
    t.bigint "questionnaire_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questionnaire_id"], name: "index_questions_on_questionnaire_id"
  end

  create_table "student_groups", force: :cascade do |t|
    t.bigint "teacher_id"
    t.string "name"
    t.integer "group_type"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_student_groups_on_teacher_id"
  end

  create_table "students", force: :cascade do |t|
    t.bigint "user_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "student_group_id"
    t.index ["student_group_id"], name: "index_students_on_student_group_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.bigint "user_id"
    t.decimal "rating", precision: 8, scale: 5
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_teachers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "role", default: 1
    t.string "vk_link"
    t.string "fb_link"
    t.string "provider"
    t.string "uid"
    t.string "phone"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "word_lists", force: :cascade do |t|
    t.string "name"
    t.integer "list_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "words", force: :cascade do |t|
    t.string "english_word"
    t.string "value"
    t.bigint "word_list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["word_list_id"], name: "index_words_on_word_list_id"
  end

  add_foreign_key "question_answers", "questions"
  add_foreign_key "questions", "questionnaires"
  add_foreign_key "student_groups", "teachers"
  add_foreign_key "students", "student_groups"
  add_foreign_key "students", "users"
  add_foreign_key "teachers", "users"
  add_foreign_key "words", "word_lists"
end
