# frozen_string_literal: true

class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.text :title, null: false
      t.integer :level, null: false, default: 1

      t.references :category, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
