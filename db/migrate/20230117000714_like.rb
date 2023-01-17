class Like < ActiveRecord::Migration[7.0]
  def change
    create_table :Like do |t|
      t.integer :Authoid ,:Postid
      t.timestamps
    end
    add_index :Authoid, :Postid
  end
end
