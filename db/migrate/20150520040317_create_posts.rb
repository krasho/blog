class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.integer :category_id
      t.boolean :is_published
      t.integer :publish_date

      t.timestamps null: false
    end
  end
end
