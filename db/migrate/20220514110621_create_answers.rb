class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :body
      t.string :user_id, null: false
      t.boolean :correct, default: false
      t.integer :question_id, null: false

      t.timestamps
    end
  end
end
