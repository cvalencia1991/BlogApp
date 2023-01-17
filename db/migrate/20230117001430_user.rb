class User < ActiveRecord::Migration[7.0]
  def change
    create_table :User do |t|
      t.text :Name , :Photo , :Bio
      t.datetime ${"created_at"}
      ${"updated_at"}
      t.integer :PostsCounter
      add_index :Name, :created_at,:updated_at
      add_reference :User, :Post, foreign_key: true
      add_reference :User, :comment, foreign_key: true
      t.timestamps
    end

  end
end
