class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :user do |t|
      t.text :name , :photo , :bio
      t.integer :postscounter
      t.timestamps
      add_index(:user, :name)
      add_reference(:comment, :user, index: false)
      add_reference(:like, :user, index: false)
      add_reference(:post, :user, index: false)
    end
  end
end
