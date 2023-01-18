class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :user do |t|
      t.text :name
      t.text :bio
      t.text :photo
      t.integer :postscounter
      t.timestamps
    end
    add_index :user, :name
    add_foreign_key :user,:post, column: :postscounter
  end
end
