class Comment < ActiveRecord::Migration[7.0]
  def change
    create_table :comment do |t|
      t.integer :Authoid
      t.integer :Postid
      t.text :text
      t.datetime${"updated_at"}
      ${"created_at"}
      t.timestamps
    end


  end
end
