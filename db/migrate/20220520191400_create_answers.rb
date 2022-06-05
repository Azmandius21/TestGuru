class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.text :body, null: false
      t.boolean :correct, null: false, default: false

      t.references :question, null: false, foreign_key: true
      t.references :author, null: false, forign_key: {to_table: :users}

      t.timestamps
    end
  end
end
