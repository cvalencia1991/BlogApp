class Post < ActiveRecord::Migration[7.0]
  def change
    create_table :Post do |t|
      t.integer :Authorid,:CommentsCounter,:LikesCounter
      t.string :title
      t.text :text
      t.timestamps
    end
  end
end
