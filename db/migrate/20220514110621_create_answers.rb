class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :body
      t.string :user
      t.boolean :correct
      t.integer :id_question

      t.timestamps
    end
  end
end
