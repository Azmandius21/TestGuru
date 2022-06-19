class Test < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  def self.sort_desc_current_category(title_category)
    joins(:category).where(categories: {title: title_category}).order(title: :DESC).pluck(:title)
  end
end
