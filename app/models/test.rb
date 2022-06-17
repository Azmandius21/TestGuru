class Test < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category

  has_many :questions
  has_many :tests_users
  has_many :users, through: :test_users

  def self.sort_desc_current_category(title_category)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: {title: title_category })
      .order('tests.title DESC')
      .pluck('tests.title')
  end
end
