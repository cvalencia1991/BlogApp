class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.integer :authorid
      t.string :title
      t.text :text
      t.timestamps
      t.integer :CommentsCounter
      t.integer :likesCounter
    end
    add_index :posts, :authorid
    add_foreign_key :posts, :likes, column: :likesCounter
    add_foreign_key :posts, :users, column: :authorid
  end
end
