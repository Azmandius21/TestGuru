class User < ApplicationRecord

  has_many :tests
  has_many :answers
  has_many :tests_users
  has_many :tests, through: :tests_users

  def show_passed_tests(level=1)
    self.tests.where(level: level)
  end
end
