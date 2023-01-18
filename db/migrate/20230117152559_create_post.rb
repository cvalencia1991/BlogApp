class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :post do |t|
      t.integer :authorid
      t.integer :commentsCounter
      t.integer :likesCounter
      t.string :title
      t.text :text
      t.timestamps
    end
    add_index :post, :authorid
    add_foreign_key :post,:like,column: :authorid
    add_foreign_key :post, :comment, column: :authorid
    add_foreign_key :post, :user, column: :authorid
  end
end
