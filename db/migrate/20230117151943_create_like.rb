class CreateLike < ActiveRecord::Migration[7.0]
  def change
    create_table :like do |t|
      t.integer :authoid
      t.integer :postid
      t.timestamps
    end
    add_index , :authoid
    add_index :like, :postid
    add_foreign_key :like,:user, column: :authorid
  end
end
