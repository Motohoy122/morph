class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :color
      t.integer :user_id
      t.timestamps
    end
    add_index :tasks, :user_id
  end
end
