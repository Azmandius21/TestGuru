class Test < ApplicationRecord

  def self.sort_desc_current_category(category)
    joins('JOIN categories ON tests.category_id = categories.id')
    .where('categories.title = :category', category: category)
    .order('tests.title DESC')
    .pluck('tests.title')
  end
end
