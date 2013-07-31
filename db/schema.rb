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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130730150520) do

  create_table "agencies", :force => true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "phone"
    t.text     "short_description"
    t.text     "long_description"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.text     "tag"
    t.integer  "client_rating"
    t.integer  "in_house_rating"
    t.integer  "overall_rating"
  end

  create_table "contacts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "agency_id"
    t.text     "notes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "phone"
    t.string   "first_name"
    t.string   "last_name"
  end

  create_table "reviews", :force => true do |t|
    t.integer  "user_id"
    t.integer  "agency_id"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "agency_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "votes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "agency_id"
    t.integer  "user_agency_id"
    t.integer  "vote",           :default => 0
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

end
