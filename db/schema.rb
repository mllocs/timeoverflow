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

ActiveRecord::Schema.define(version: 20131104032622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"
  enable_extension "pg_trgm"

  create_table "accounts", force: true do |t|
    t.integer  "accountable_id"
    t.string   "accountable_type"
    t.integer  "balance"
    t.integer  "max_allowed_balance"
    t.integer  "min_allowed_balance"
    t.boolean  "flagged"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["accountable_id", "accountable_type"], name: "index_accounts_on_accountable_id_and_accountable_type", using: :btree

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "categories", force: true do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.hstore   "name_translations"
  end

  create_table "members", force: true do |t|
    t.integer  "user_id"
    t.integer  "organization_id"
    t.boolean  "manager"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "entry_date"
    t.integer  "member_uid"
  end

  add_index "members", ["organization_id"], name: "index_members_on_organization_id", using: :btree
  add_index "members", ["user_id"], name: "index_members_on_user_id", using: :btree

  create_table "movements", force: true do |t|
    t.integer  "account_id"
    t.integer  "transfer_id"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "movements", ["account_id"], name: "index_movements_on_account_id", using: :btree
  add_index "movements", ["transfer_id"], name: "index_movements_on_transfer_id", using: :btree

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "reg_number_seq"
    t.string   "theme"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.string   "type"
    t.integer  "category_id"
    t.integer  "user_id"
    t.text     "description"
    t.date     "start_on"
    t.date     "end_on"
    t.boolean  "permanent"
    t.boolean  "joinable"
    t.boolean  "global"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "tags",                     array: true
  end

  add_index "posts", ["category_id"], name: "index_posts_on_category_id", using: :btree
  add_index "posts", ["tags"], name: "index_posts_on_tags", using: :gin
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "transfers", force: true do |t|
    t.integer  "post_id"
    t.text     "reason"
    t.integer  "operator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transfers", ["operator_id"], name: "index_transfers_on_operator_id", using: :btree
  add_index "transfers", ["post_id"], name: "index_transfers_on_post_id", using: :btree

  create_table "user_joined_post", force: true do |t|
    t.integer "user_id"
    t.integer "post_id"
  end

  create_table "users", force: true do |t|
    t.string   "username",          null: false
    t.string   "email",             null: false
    t.string   "password_digest"
    t.date     "date_of_birth"
    t.string   "identity_document"
    t.string   "phone"
    t.string   "alt_phone"
    t.text     "address"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.datetime "deleted_at"
    t.string   "gender"
    t.text     "description"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

end