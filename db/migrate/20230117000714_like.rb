class Like < ActiveRecord::Migration[7.0]
  def change
    create_table :Like do |t|
      t.integer :Authoid
      t.integer :Postid
      t.datetime ${"created_at"}
      ${"updated_at"}
      t.timestamps
    end

  end
end
