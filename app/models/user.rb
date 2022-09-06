# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  EMAIL_FORMAT = /^[0-9a-z]+@[0-9a-z]+[.][A-z]{2,3}/.freeze

  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates :email, presence: true
  validate :email_validation, on: :create

  def show_passed_tests(level = 1)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  private

  def email_validation
    errors.add :email_format, message: 'It is not email format' unless email =~ EMAIL_FORMAT
  end
end
