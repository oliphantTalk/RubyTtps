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

ActiveRecord::Schema.define(version: 20171213225413) do

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "username"
    t.string "name"
    t.string "surname"
    t.integer "dni"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "course_students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "course_id"
    t.bigint "student_id"
    t.string "status", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_students_on_course_id"
    t.index ["student_id"], name: "index_course_students_on_student_id"
  end

  create_table "courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "year"
    t.bigint "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_of_evaluation", default: 3
    t.index ["subject_id"], name: "index_courses_on_subject_id"
  end

  create_table "courses_teachers", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "course_id", null: false
    t.bigint "teacher_id", null: false
    t.index ["course_id", "teacher_id"], name: "index_courses_teachers_on_course_id_and_teacher_id"
  end

  create_table "evaluations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.date "date"
    t.integer "min_score"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_evaluations_on_course_id"
  end

  create_table "evaluations_students", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "Evaluation_id", null: false
    t.bigint "Student_id", null: false
    t.date "date"
    t.string "instance"
    t.string "score", default: "Ausente"
    t.index ["Evaluation_id", "Student_id"], name: "index_Evaluations_Students_on_evaluation_id_and_student_id"
  end

  create_table "students", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 30
    t.string "surname", limit: 30
    t.integer "dni"
    t.integer "legajo"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dni"], name: "index_students_on_dni", unique: true
    t.index ["email"], name: "index_students_on_email", unique: true
  end

  create_table "subjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "year"
    t.text "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_subjects_on_name", unique: true
  end

  create_table "teachers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 20
    t.string "surname", limit: 20
    t.string "username", limit: 20
    t.string "password"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
    t.index ["username"], name: "index_teachers_on_username", unique: true
  end

  add_foreign_key "courses", "subjects"
  add_foreign_key "evaluations", "courses"
end
