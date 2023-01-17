class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :Comment do |t|
      t.integer :authoid, :postid
      t.text :text
      t.timestamps
      add_index :authoid, :postid
    end
  end

end
