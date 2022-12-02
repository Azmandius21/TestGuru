class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :picture_url
      t.string :reason_for_the_gift

      t.timestamps
    end
  end
end
