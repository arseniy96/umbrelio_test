class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.string :user_ip
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
