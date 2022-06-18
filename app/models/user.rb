class User < ApplicationRecord

  has_many :created_tests, class_name: 'Test', dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users

  def show_passed_tests(level=1)
    self.tests.where(level: level)
  end
end
