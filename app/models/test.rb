class Test < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :sort_current_category, -> (title_category){
    joins(:category)
      .where(categories: {title: title_category})
      .order(title: :DESC)
      .pluck(:title) }

  validates :title, presence: true,
                    uniqueness: { scope: [:title, :level]}
  validates :level, numericality: { only_integer: true }

  def self.sort_desc_current_category(title_category)
    joins(:category)
      .where(categories: {title: title_category})
      .order(title: :DESC)
      .pluck(:title)
  end
end
