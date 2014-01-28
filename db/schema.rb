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

ActiveRecord::Schema.define(version: 20140127183504) do

  create_table "favorites", force: true do |t|
    t.integer  "property_id"
    t.integer  "user_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorites", ["property_id"], name: "index_favorites_on_property_id"
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id"

  create_table "parties", force: true do |t|
    t.integer  "property_id"
    t.string   "partyType"
    t.string   "partyName"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "parties", ["property_id"], name: "index_parties_on_property_id"

  create_table "properties", force: true do |t|
    t.date    "auctionDate"
    t.string  "auctionStatus"
    t.string  "caseID"
    t.string  "caseType"
    t.decimal "judgement"
    t.decimal "assesed"
    t.string  "parcel"
    t.string  "address"
    t.string  "city"
    t.string  "state"
    t.string  "zip"
    t.string  "legal"
    t.string  "zillow"
  end

  create_table "users", force: true do |t|
    t.string   "username",               default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "zillow_details", force: true do |t|
    t.integer  "property_id"
    t.string   "zpid"
    t.string   "useCode"
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "year"
    t.decimal  "lot"
    t.decimal  "area"
    t.decimal  "baths"
    t.decimal  "beds"
    t.date     "lastSoldDate"
    t.decimal  "lastSold"
    t.decimal  "zEstimate"
    t.date     "zEstimateDate"
    t.decimal  "zRentEstimate"
    t.date     "zRentEstimateDate"
    t.string   "zillowDetails"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "zillow_details", ["property_id"], name: "index_zillow_details_on_property_id"

end
