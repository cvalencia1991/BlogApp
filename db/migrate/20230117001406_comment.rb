class Comment < ActiveRecord::Migration[7.0]
  def change
    create_table :comment do |t|
      t.integer :Authoid, :Postid
      t.text :text
      t.datetime :updated_at , :created_at
      add_index :Authoid, :Postid
      add_reference :comment,:Post ,foreign_key: true
      t.timestamps
    end


  end
end
