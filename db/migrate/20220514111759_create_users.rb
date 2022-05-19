class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :pasword, default: ''
      t.boolean :admin, default: false
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
