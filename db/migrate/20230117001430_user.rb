class User < ActiveRecord::Migration[7.0]
  def change
    create_table :User do |t|
      t.text :Name , :Photo , :Bio
      t.integer :PostsCounter
      t.timestamps
    end

    add_reference :User, :Post, foreign_key: true
    add_reference :User, :comment, foreign_key: true
  end
end
