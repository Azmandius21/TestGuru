class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.integer :level, null: false
      t.string :title

      t.timestamps
    end
  end
end
