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

ActiveRecord::Schema.define(version: 20151005023139) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "about_graduates", force: :cascade do |t|
    t.text     "about"
    t.string   "profession"
    t.string   "achievements"
    t.string   "competence"
    t.string   "recomendations"
    t.string   "photo"
    t.integer  "graduate_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "about_graduates", ["graduate_id"], name: "index_about_graduates_on_graduate_id", using: :btree

  create_table "abouts", force: :cascade do |t|
    t.string   "about"
    t.string   "count_people"
    t.string   "achievements"
    t.string   "pluses"
    t.integer  "new_company_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "institution_id"
  end

  add_index "abouts", ["institution_id"], name: "index_abouts_on_institution_id", using: :btree
  add_index "abouts", ["new_company_id"], name: "index_abouts_on_new_company_id", using: :btree

  create_table "bank_requesits", force: :cascade do |t|
    t.string   "bill"
    t.string   "bank"
    t.string   "adress_bank"
    t.string   "bik"
    t.string   "inn"
    t.string   "kpp"
    t.string   "cor_bill"
    t.integer  "new_company_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "institution_id"
  end

  add_index "bank_requesits", ["institution_id"], name: "index_bank_requesits_on_institution_id", using: :btree
  add_index "bank_requesits", ["new_company_id"], name: "index_bank_requesits_on_new_company_id", using: :btree

  create_table "banner_regions", force: :cascade do |t|
    t.string   "width"
    t.string   "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "banners", force: :cascade do |t|
    t.integer  "banner_region_id"
    t.string   "path"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "banners", ["banner_region_id"], name: "index_banners_on_banner_region_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.string   "short_name"
    t.string   "english_name"
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id", using: :btree

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

  add_index "company_comments", ["company_id"], name: "index_company_comments_on_company_id", using: :btree
  add_index "company_comments", ["user_id"], name: "index_company_comments_on_user_id", using: :btree

  create_table "company_news", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "company_id"
    t.integer  "user_id"
  end

  create_table "company_practices", force: :cascade do |t|
    t.boolean  "payment"
    t.string   "long"
    t.string   "post"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "new_company_id"
  end

  create_table "company_reviews", force: :cascade do |t|
    t.text     "review"
    t.integer  "mark"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "company_id"
  end

  add_index "company_reviews", ["user_id"], name: "index_company_reviews_on_user_id", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "graduate_bank_requesits", force: :cascade do |t|
    t.string   "bill"
    t.string   "bank"
    t.string   "bank_adress"
    t.string   "bik"
    t.string   "inn"
    t.string   "kpp"
    t.string   "cor_bill"
    t.integer  "graduate_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "graduate_bank_requesits", ["graduate_id"], name: "index_graduate_bank_requesits_on_graduate_id", using: :btree

  create_table "graduate_requesits", force: :cascade do |t|
    t.date     "birth_date"
    t.string   "place_birth"
    t.string   "nationality"
    t.string   "sex"
    t.string   "inn"
    t.integer  "graduate_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "graduate_requesits", ["graduate_id"], name: "index_graduate_requesits_on_graduate_id", using: :btree

  create_table "graduates", force: :cascade do |t|
    t.string   "lastname"
    t.string   "name"
    t.string   "second_name"
    t.string   "status"
    t.string   "doc_adress"
    t.string   "post_adress"
    t.string   "phone"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "graduates", ["user_id"], name: "index_graduates_on_user_id", using: :btree

  create_table "industries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "institutions", force: :cascade do |t|
    t.string   "org_type"
    t.string   "title"
    t.string   "logo"
    t.string   "full_adress"
    t.string   "post_adress"
    t.string   "phone"
    t.string   "faks"
    t.string   "email"
    t.string   "website"
    t.string   "director_fio"
    t.string   "director_post"
    t.string   "contact_fio"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "institutions", ["user_id"], name: "index_institutions_on_user_id", using: :btree

  create_table "menu_categories", force: :cascade do |t|
    t.string   "title"
    t.string   "link"
    t.boolean  "publish"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "color"
  end

  create_table "menu_items", force: :cascade do |t|
    t.string   "title"
    t.string   "link"
    t.boolean  "publish"
    t.integer  "menu_category_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "menu_items", ["menu_category_id"], name: "index_menu_items_on_menu_category_id", using: :btree

  create_table "new_companies", force: :cascade do |t|
    t.string   "company_type"
    t.string   "full_title"
    t.string   "short_title"
    t.string   "english_title"
    t.string   "specialization"
    t.string   "logo"
    t.string   "full_adress"
    t.string   "post_adress"
    t.string   "phone"
    t.string   "faks"
    t.string   "email"
    t.string   "website"
    t.string   "director_name"
    t.string   "director_post"
    t.string   "contact_name"
    t.string   "contacy_phone"
    t.string   "contact_email"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "new_companies", ["user_id"], name: "index_new_companies_on_user_id", using: :btree

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.boolean  "publish"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "redactor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "redactor_assets", ["assetable_type", "assetable_id"], name: "idx_redactor_assetable", using: :btree
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_redactor_assetable_type", using: :btree

  create_table "requesits", force: :cascade do |t|
    t.string   "inn"
    t.string   "kpp"
    t.string   "ogrn"
    t.string   "oktmo"
    t.string   "okpo"
    t.string   "okato"
    t.string   "okogu"
    t.string   "okfs"
    t.string   "okopf"
    t.string   "okved1"
    t.string   "okved2"
    t.string   "okved3s"
    t.integer  "new_company_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "institution_id"
  end

  add_index "requesits", ["institution_id"], name: "index_requesits_on_institution_id", using: :btree
  add_index "requesits", ["new_company_id"], name: "index_requesits_on_new_company_id", using: :btree

  create_table "resume_answers", force: :cascade do |t|
    t.integer  "resume_id"
    t.integer  "company_id"
    t.datetime "when_viewed"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "resume_answers", ["company_id"], name: "index_resume_answers_on_company_id", using: :btree
  add_index "resume_answers", ["resume_id"], name: "index_resume_answers_on_resume_id", using: :btree

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

  add_index "resume_contacts", ["resume_id"], name: "index_resume_contacts_on_resume_id", using: :btree

  create_table "resume_courses", force: :cascade do |t|
    t.string   "title"
    t.string   "organization"
    t.string   "specialization"
    t.string   "expire_year"
    t.integer  "resume_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "resume_courses", ["resume_id"], name: "index_resume_courses_on_resume_id", using: :btree

  create_table "resume_exams", force: :cascade do |t|
    t.string   "title"
    t.string   "organization"
    t.string   "specialization"
    t.string   "expire_year"
    t.integer  "resume_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "resume_exams", ["resume_id"], name: "index_resume_exams_on_resume_id", using: :btree

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

  add_index "resume_recomendations", ["resume_id"], name: "index_resume_recomendations_on_resume_id", using: :btree

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

  add_index "resume_works", ["resume_id"], name: "index_resume_works_on_resume_id", using: :btree

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

  add_index "resumes", ["user_id"], name: "index_resumes_on_user_id", using: :btree

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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role"
    t.string   "name"
    t.string   "image"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vacancies", force: :cascade do |t|
    t.string   "title"
    t.text     "requrements"
    t.text     "description"
    t.string   "employment"
    t.float    "salary"
    t.integer  "new_company_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "city"
  end

  add_index "vacancies", ["new_company_id"], name: "index_vacancies_on_new_company_id", using: :btree

  add_foreign_key "about_graduates", "graduates"
  add_foreign_key "abouts", "institutions"
  add_foreign_key "abouts", "new_companies"
  add_foreign_key "bank_requesits", "institutions"
  add_foreign_key "bank_requesits", "new_companies"
  add_foreign_key "banners", "banner_regions"
  add_foreign_key "companies", "users"
  add_foreign_key "company_comments", "companies"
  add_foreign_key "company_comments", "users"
  add_foreign_key "company_reviews", "users"
  add_foreign_key "graduate_bank_requesits", "graduates"
  add_foreign_key "graduate_requesits", "graduates"
  add_foreign_key "graduates", "users"
  add_foreign_key "institutions", "users"
  add_foreign_key "menu_items", "menu_categories"
  add_foreign_key "new_companies", "users"
  add_foreign_key "requesits", "institutions"
  add_foreign_key "requesits", "new_companies"
  add_foreign_key "resume_answers", "companies"
  add_foreign_key "resume_answers", "resumes"
  add_foreign_key "resume_contacts", "resumes"
  add_foreign_key "resume_courses", "resumes"
  add_foreign_key "resume_exams", "resumes"
  add_foreign_key "resume_recomendations", "resumes"
  add_foreign_key "resume_works", "resumes"
  add_foreign_key "resumes", "users"
  add_foreign_key "vacancies", "new_companies"
end
