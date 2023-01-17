class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comment do |t|
      t.integer :authoid, :postid
      t.text :text
      add_index(:comment, :authorid)
      t.timestamps
    end
  end
end
