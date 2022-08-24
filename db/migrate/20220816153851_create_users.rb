# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :name, null: false
      t.text :email, null: false
      t.text :password, null: false, default: ''

      t.timestamps
    end
  end
end
