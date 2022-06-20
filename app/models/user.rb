class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users

  scope :list_passed_tests, -> (user_id, level=1){ find(user_id).tests.where(level: level) }

  validates :email, presence: true

  def show_passed_tests(level=1)
    self.tests.where(level: level)
  end
end
