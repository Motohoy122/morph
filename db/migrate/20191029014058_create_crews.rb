class CreateCrews < ActiveRecord::Migration[5.2]
  def change
    create_table :crews do |t|
      t.string :title
      t.text :description
      t.string :color
      t.integer :user_id
      t.timestamps
    end
    add_index :crews, :user_id
  end
end
