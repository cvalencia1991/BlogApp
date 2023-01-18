class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comment do |t|
      t.integer :authoid
      t.integer :postid
      t.text :text
      t.timestamps
    end
    add_index :comment, :authoid
    add_index :comment, :postid
    add_foreign_key :comment,:user, column: :authoid
  end
end
