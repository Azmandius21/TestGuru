class AddCategoriesLevelNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:categories, :level, false)
  end
end
