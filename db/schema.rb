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

ActiveRecord::Schema.define(version: 20_230_124_090_627) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'achievements', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'badge_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['badge_id'], name: 'index_achievements_on_badge_id'
    t.index ['user_id'], name: 'index_achievements_on_user_id'
  end

  create_table 'answers', force: :cascade do |t|
    t.text 'body', null: false
    t.boolean 'correct', default: false, null: false
    t.bigint 'question_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['question_id'], name: 'index_answers_on_question_id'
  end

  create_table 'badges', force: :cascade do |t|
    t.string 'title', null: false
    t.string 'picture_url'
    t.bigint 'rule_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['rule_id'], name: 'index_badges_on_rule_id'
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'title', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'gists', force: :cascade do |t|
    t.string 'html_url', null: false
    t.bigint 'user_id', null: false
    t.bigint 'question_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['question_id'], name: 'index_gists_on_question_id'
    t.index ['user_id'], name: 'index_gists_on_user_id'
  end

  create_table 'questions', force: :cascade do |t|
    t.text 'body', null: false
    t.bigint 'test_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['test_id'], name: 'index_questions_on_test_id'
  end

  create_table 'rules', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'description'
  end

  create_table 'test_passages', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'test_id'
    t.bigint 'current_question_id'
    t.integer 'correct_questions', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'success', default: false
    t.index ['current_question_id'], name: 'index_test_passages_on_current_question_id'
    t.index ['test_id'], name: 'index_test_passages_on_test_id'
    t.index ['user_id'], name: 'index_test_passages_on_user_id'
  end

  create_table 'tests', force: :cascade do |t|
    t.text 'title', null: false
    t.integer 'level', default: 1, null: false
    t.bigint 'category_id', null: false
    t.bigint 'author_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'limit_time'
    t.index ['author_id'], name: 'index_tests_on_author_id'
    t.index ['category_id'], name: 'index_tests_on_category_id'
    t.index %w[title level], name: 'index_tests_on_title_and_level', unique: true
  end

  create_table 'users', force: :cascade do |t|
    t.text 'email', default: '', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.string 'type', default: 'User', null: false
    t.string 'first_name'
    t.string 'last_name'
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index ['type'], name: 'index_users_on_type'
  end

  add_foreign_key 'achievements', 'badges'
  add_foreign_key 'achievements', 'users'
  add_foreign_key 'answers', 'questions'
  add_foreign_key 'badges', 'rules'
  add_foreign_key 'gists', 'questions'
  add_foreign_key 'gists', 'users'
  add_foreign_key 'questions', 'tests'
  add_foreign_key 'test_passages', 'questions', column: 'current_question_id'
  add_foreign_key 'test_passages', 'tests'
  add_foreign_key 'test_passages', 'users'
  add_foreign_key 'tests', 'categories'
  add_foreign_key 'tests', 'users', column: 'author_id'
end
