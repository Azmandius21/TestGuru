class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :rules do |t|
      t.string :name, null: false
      t.string :description

      t.timestamp
    end

    create_table :badges do |t|
      t.string :title, null: false
      t.string :picture_url

      t.references :rule, null: false, foreign_key: true, dependent: :destroy

      t.timestamps
    end

    create_table :achievements do |t|
      t.references :user, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
