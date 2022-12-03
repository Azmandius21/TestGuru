class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :picture_url
      t.string :rule
      t.integer :level
      t.references :category

      t.timestamps
    end
  end
end
