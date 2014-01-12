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

ActiveRecord::Schema.define(version: 20140112015612) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "token_secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["user_id"], name: "index_authentications_on_user_id", using: :btree

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "notebook_notes", force: true do |t|
    t.integer  "user_id"
    t.integer  "notebook_id"
    t.string   "name"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notebook_notes", ["notebook_id"], name: "index_notebook_notes_on_notebook_id", using: :btree
  add_index "notebook_notes", ["user_id"], name: "index_notebook_notes_on_user_id", using: :btree

  create_table "notebooks", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notebooks", ["user_id"], name: "index_notebooks_on_user_id", using: :btree

  create_table "project_collaborators", force: true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_notes", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "name"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_notes", ["project_id"], name: "index_project_notes_on_project_id", using: :btree
  add_index "project_notes", ["user_id"], name: "index_project_notes_on_user_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",                           null: false
    t.string   "encrypted_password",     default: "",                           null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                            null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "time_zone",              default: "Central Time (US & Canada)"
    t.string   "profile_image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
