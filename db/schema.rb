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

ActiveRecord::Schema.define(:version => 20111003023118) do

  create_table "bibls", :force => true do |t|
    t.integer  "definition_id"
    t.string   "code"
    t.string   "title"
    t.string   "scope"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "definitions", :force => true do |t|
    t.text     "text"
    t.string   "kind"
    t.integer  "entry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "part_of_speech_id"
  end

  create_table "entries", :force => true do |t|
    t.integer  "letter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "letters", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "part_of_speeches", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "terms", :force => true do |t|
    t.string   "name"
    t.integer  "word_id"
    t.integer  "entry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "translations", :force => true do |t|
    t.integer  "definition_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "words", :force => true do |t|
    t.string   "name"
    t.integer  "entry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
