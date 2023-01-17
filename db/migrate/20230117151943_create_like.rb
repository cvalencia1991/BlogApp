class CreateLike < ActiveRecord::Migration[7.0]
  def change
    create_table :Like do |t|
      t.integer :authoid ,:postid
      t.timestamps
      add_index :authoid, :postid
    end

  end

end
