class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.text, :title
      t.text, :picture_url

      t.timestamps
    end
  end
end
