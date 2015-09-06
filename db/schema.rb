# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150906132649) do

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "title"
    t.string   "logo"
    t.string   "specialization"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "description"
    t.string   "company_type"
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id"

  create_table "company_clients", force: :cascade do |t|
    t.string   "title"
    t.string   "website"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "company_id"
  end

  create_table "company_comments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "company_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "company_comments", ["company_id"], name: "index_company_comments_on_company_id"
  add_index "company_comments", ["user_id"], name: "index_company_comments_on_user_id"

  create_table "company_contacts", force: :cascade do |t|
    t.string   "phone"
    t.string   "adress"
    t.string   "fio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "company_id"
  end

  create_table "company_news", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "company_id"
    t.integer  "user_id"
  end

  create_table "company_reviews", force: :cascade do |t|
    t.text     "review"
    t.integer  "mark"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "company_id"
  end

  add_index "company_reviews", ["user_id"], name: "index_company_reviews_on_user_id"

  create_table "company_vacancies", force: :cascade do |t|
    t.string   "title"
    t.text     "requirements"
    t.text     "description"
    t.string   "employment"
    t.integer  "salary"
    t.integer  "company_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "company_vacancies", ["company_id"], name: "index_company_vacancies_on_company_id"
  add_index "company_vacancies", ["user_id"], name: "index_company_vacancies_on_user_id"

  create_table "events", force: :cascade do |t|
    t.integer  "author_id"
    t.string   "title"
    t.text     "text"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.boolean  "all_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resume_answers", force: :cascade do |t|
    t.integer  "resume_id"
    t.integer  "company_id"
    t.datetime "when_viewed"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "resume_answers", ["company_id"], name: "index_resume_answers_on_company_id"
  add_index "resume_answers", ["resume_id"], name: "index_resume_answers_on_resume_id"

  create_table "resume_contacts", force: :cascade do |t|
    t.string   "mobile_phone"
    t.string   "home_phone"
    t.string   "work_phone"
    t.string   "email"
    t.string   "icq"
    t.string   "skype"
    t.string   "vk"
    t.string   "facebook"
    t.string   "linkedin"
    t.integer  "resume_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "resume_contacts", ["resume_id"], name: "index_resume_contacts_on_resume_id"

  create_table "resume_courses", force: :cascade do |t|
    t.string   "title"
    t.string   "organization"
    t.string   "specialization"
    t.string   "expire_year"
    t.integer  "resume_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "resume_courses", ["resume_id"], name: "index_resume_courses_on_resume_id"

  create_table "resume_exams", force: :cascade do |t|
    t.string   "title"
    t.string   "organization"
    t.string   "specialization"
    t.string   "expire_year"
    t.integer  "resume_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "resume_exams", ["resume_id"], name: "index_resume_exams_on_resume_id"

  create_table "resume_posts", force: :cascade do |t|
    t.string   "wish_post"
    t.string   "specialization"
    t.float    "salary"
    t.string   "employment"
    t.string   "timetable"
    t.integer  "resume_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "resume_recomendations", force: :cascade do |t|
    t.string   "name"
    t.string   "post"
    t.string   "organization"
    t.string   "phone"
    t.integer  "resume_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "resume_recomendations", ["resume_id"], name: "index_resume_recomendations_on_resume_id"

  create_table "resume_works", force: :cascade do |t|
    t.string   "organization"
    t.string   "region"
    t.string   "website"
    t.string   "sphere"
    t.string   "post"
    t.date     "begin_work"
    t.date     "end_work"
    t.text     "functions"
    t.string   "skills"
    t.text     "about"
    t.integer  "resume_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "resume_works", ["resume_id"], name: "index_resume_works_on_resume_id"

  create_table "resumes", force: :cascade do |t|
    t.string   "surname"
    t.string   "name"
    t.string   "patronymic"
    t.date     "bith_date"
    t.boolean  "sex"
    t.string   "city"
    t.string   "change_location"
    t.string   "change_location_place"
    t.boolean  "ready_business_trip"
    t.string   "nationality"
    t.string   "work_ticket"
    t.string   "time_to_work"
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "photo"
  end

  add_index "resumes", ["user_id"], name: "index_resumes_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role"
    t.string   "name"
    t.string   "image"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "vacancies", force: :cascade do |t|
    t.string   "title"
    t.text     "requirements"
    t.text     "description"
    t.string   "employment"
    t.integer  "salary"
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "vacancies", ["company_id"], name: "index_vacancies_on_company_id"
  add_index "vacancies", ["user_id"], name: "index_vacancies_on_user_id"

  create_table "vacancy_answers", force: :cascade do |t|
    t.integer  "resume_id"
    t.integer  "company_vacancy_id"
    t.datetime "when_viewed"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "vacancy_answers", ["company_vacancy_id"], name: "index_vacancy_answers_on_company_vacancy_id"
  add_index "vacancy_answers", ["resume_id"], name: "index_vacancy_answers_on_resume_id"

end
