class Post < ActiveRecord::Migration[7.0]
  def change
    create_table :Post do |t|
      t.integer :AuthorId
      t.string :title
      t.text :text
      t.datetime ${"created_at"}
      ${"updated_at"}
      t.integer :CommentsCounter
      t.integer :LikesCounter

      t.timestamps
    end

  end
end
