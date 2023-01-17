class Post < ActiveRecord::Migration[7.0]
  def change
    create_table :Post do |t|
      t.integer :Authorid,:CommentsCounter,:LikesCounter
      t.string :title
      t.text :text
      t.datetime ${"created_at"}
      ${"updated_at"}
      add_index :AuthorId, :created_at,:updated_at
      add_reference :Post, :comment, foreign_key: true
      add_reference :Post, :Like, foreign_key: true
      t.timestamps
    end

  end
end
