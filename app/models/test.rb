class Test < ApplicationRecord

  def self.sort_desc_from_category(category)
    #self.joins(:category).where(category_id: Category.find_by(title: category).id).order(title: :desc).pluck(:title)
    self.joins("JOIN categories ON tests.category_id = categories.id
      WHERE categories.title = '#{category}' ORDER BY title DESC")
  end
end
