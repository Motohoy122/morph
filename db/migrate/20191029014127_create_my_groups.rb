class CreateMyGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :my_groups do |t|
      t.integer :task
      t.integer :equipment
      t.integer :crew
      t.integer :user_id
      t.timestamps
    end
    add_index :my_groups, :user_id
  end
end
