class User < ActiveRecord::Migration[7.0]
  def change
    create_table :User do |t|
      t.text :Name
      t.text :Photo
      t.text :Bio
      t.datetime ${"created_at"}
      ${"updated_at"}
      t.integer :PostsCounter

      t.timestamps
    end

  end
end
