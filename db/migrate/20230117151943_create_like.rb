class CreateLike < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :authoid ,:postid
      add_index(:like, :authorid)
      add_index(:like, :postid)
      t.timestamps
    end
  end
end
