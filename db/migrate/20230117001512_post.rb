class Post < ActiveRecord::Migration[7.0]
  def change
    create_table :Post do |t|
      t.integer :Authorid,:CommentsCounter,:LikesCounter
      t.string :title
      t.text :text
      t.timestamps
    end

    add_reference :Post, :comment, foreign_key: true
    add_reference :Post, :Like, foreign_key: true
  end
end
