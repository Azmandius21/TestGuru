class AddSuccessToTestPassage < ActiveRecord::Migration[5.2]
  def up
    add_column :test_passages, :success, :boolean, default: false
  end

  def down
    remove_column :test_passages, :success
  end
end
