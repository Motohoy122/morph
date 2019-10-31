class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :job_name
      t.integer :user_id
      t.integer :schedules
      t.timestamps
    end
    add_index :projects, :user_id
  end
end
