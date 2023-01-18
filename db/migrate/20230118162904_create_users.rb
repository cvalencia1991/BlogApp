class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :name
      t.text :Photo
      t.text :Bio
      t.timestamps
      t.integer :PostsCounter
    end
    add_index :users, :name
  end
end
