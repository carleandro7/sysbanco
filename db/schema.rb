# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_02_212757) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.string "cpf"
    t.decimal "saldo", precision: 8, scale: 2
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "depositos", force: :cascade do |t|
    t.decimal "valor", precision: 8, scale: 2
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_depositos_on_account_id"
  end

  create_table "saques", force: :cascade do |t|
    t.decimal "valor", precision: 8, scale: 2
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_saques_on_account_id"
  end

  create_table "transferaccounts", force: :cascade do |t|
    t.string "operacao"
    t.bigint "transfer_id", null: false
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_transferaccounts_on_account_id"
    t.index ["transfer_id"], name: "index_transferaccounts_on_transfer_id"
  end

  create_table "transfers", force: :cascade do |t|
    t.decimal "valor", precision: 8, scale: 2
    t.decimal "taxa", precision: 8, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "depositos", "accounts"
  add_foreign_key "saques", "accounts"
  add_foreign_key "transferaccounts", "accounts"
  add_foreign_key "transferaccounts", "transfers"
end
