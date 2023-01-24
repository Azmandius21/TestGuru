class AddLimitTimeToTest < ActiveRecord::Migration[5.2]
  def up
    add_column :tests, :limit_time, :integer
    add_column :tests, :duration_time, :integer, default: 0
  end

  def down
    remove_column(:tests, :limit_time)
    remove_column(:tests, :duration_time)
  end
end
