class AddTypeAttributesToUsers < ActiveRecord::Migration[5.2]

  def self.up
    change_table :users do |t|
      t.string :type, null: false, default: 'User'
      t.index :type
      t.string :first_name
      t.string :last_name
    end

    remove_column(:users, :name)
  end

  def self.down
    remove_columns(:users, :type, :first_name, :last_name)
    remove_index(:users, :type)

    add_column :users, :name, :string
  end
end
