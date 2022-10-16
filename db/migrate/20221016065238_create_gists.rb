class CreateGists < ActiveRecord::Migration[5.2]
  def change
    create_table :gists do |t|
      t.string :html_url, null: false
      t.references :user, null: false, foreign_key: true
      t.references :qiestion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
