class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :authorid
      t.integer :postid
      t.text :text
      t.timestamps
    end
    add_index :comments, :authorid
    add_index :comments, :postid
    add_foreign_key  :comments,:users, column: :authorid
    add_foreign_key  :comments,:posts, column: :postid
  end
end
