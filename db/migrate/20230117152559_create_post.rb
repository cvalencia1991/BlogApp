class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :post do |t|
      t.integer :authorid,:commentsCounter,:likesCounter
      t.string :title
      t.text :text
      add_index(:post, :authorid)
      add_reference(:comment, :post, index: false)
      add_reference(:like, :post, index: false)
      t.timestamps
    end
  end
end
