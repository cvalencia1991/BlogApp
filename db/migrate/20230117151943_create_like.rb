class CreateLike < ActiveRecord::Migration[7.0]
  def change
    create_table :like do |t|
      t.integer :authoid
      t.integer :postid
      t.timestamps
    end
    add_index :like, :authoid
    add_foreign_key :like,:user column: :authoid
  end
end
