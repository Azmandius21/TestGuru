class Test < ApplicationRecord
  def self.special_category(category)
    self.where(category_id: category).order(title: :desc).pluck(:title)
  end
end
