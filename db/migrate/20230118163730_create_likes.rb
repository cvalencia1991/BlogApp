class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :authorid
      t.integer :postid
      t.timestamps
    end
    add_index :likes, :authorid
    add_index :likes, :postid
    add_foreign_key :likes,:users, column: :authorid
    end
end
