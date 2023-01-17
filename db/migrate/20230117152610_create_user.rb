class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :User do |t|
      t.text :name , :photo , :bio
      t.integer :postscounter
      t.timestamps
      add_index :name
      add_reference :user, :comment, index: true, foreign_key: true
      add_reference :user, :post, index: true, foreign_key: true
      add_reference :user, :like, index: true, foreign_key: true
    end
  end
end
