class AddAnswersUserNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:answers, :user, false)
  end
end
