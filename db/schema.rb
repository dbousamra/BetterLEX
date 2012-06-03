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

ActiveRecord::Schema.define(:version => 20120603085907) do

  create_table "reviews", :force => true do |t|
    t.integer  "subject_id"
    t.integer  "difficulty"
    t.integer  "workload"
    t.text     "review"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "username"
    t.boolean  "recommend"
    t.integer  "semester"
  end

  add_index "reviews", ["subject_id"], :name => "index_reviews_on_subject_id"

  create_table "subjects", :force => true do |t|
    t.string   "code"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
