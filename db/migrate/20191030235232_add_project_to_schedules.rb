class AddProjectToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :project_id, :integer
  end
end
