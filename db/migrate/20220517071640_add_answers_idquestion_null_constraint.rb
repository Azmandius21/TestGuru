class AddAnswersIdquestionNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:answers, :id_question, false)
  end
end
