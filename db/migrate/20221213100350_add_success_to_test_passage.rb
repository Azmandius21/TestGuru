class AddSuccessToTestPassage < ActiveRecord::Migration[5.2]
  def self.up
    add_column :test_passages, :success, :boolean, default: false
  end

  def self.down
    remove_column :test_passages, :success
  end
end
