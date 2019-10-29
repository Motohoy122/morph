class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.integer :project
      t.text :location
      t.integer :lot_count
      t.integer :task
      t.integer :crew
      t.integer :equipment
      t.integer :my_group
      t.integer :user_id
      t.timestamps
    end
    add_index :schedules, :user_id
  end
end
