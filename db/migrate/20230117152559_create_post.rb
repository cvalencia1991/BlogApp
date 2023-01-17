class CreatePost < ActiveRecord::Migration[7.0]
  def change
    create_table :Post do |t|
      t.integer :authorid,:commentsCounter,:likesCounter
      t.string :title
      t.text :text
      t.timestamps
      add_index :authoid
      add_reference :post, :like, index: true, foreign_key: true
      add_reference :post, :comment, index: true, foreign_key: true

    end
  end
end
