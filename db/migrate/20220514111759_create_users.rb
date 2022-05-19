class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :pasword, default: ''
      t.string :type, default: 'customer'
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
