class AddLimitTimeToTest < ActiveRecord::Migration[5.2]
  def up
    add_column :tests, :limit_time, :integer
  end

  def down
    remove_column(:tests, :limit_time)
  end
end
