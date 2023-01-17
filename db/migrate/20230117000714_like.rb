class Like < ActiveRecord::Migration[7.0]
  def change
    create_table :Like do |t|
      t.integer :Authoid ,:Postid
      t.datetime :created_at, :updated_at
      t.timestamps
      add_index :Authoid, :Postid
      add_reference :Like, :User, foreign_key: true
    end

  end
end
