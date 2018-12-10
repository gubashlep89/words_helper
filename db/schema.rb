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

ActiveRecord::Schema.define(version: 2018_12_05_192752) do

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
  add_foreign_key "words", "word_lists"
end
