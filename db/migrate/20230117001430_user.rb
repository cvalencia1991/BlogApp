class User < ActiveRecord::Migration[7.0]
  def change
    create_table :User do |t|
      t.text :Name , :Photo , :Bio
      t.integer :PostsCounter
      t.timestamps
    end
  end
end
