class ChangeProjectToBeIntInSchedules < ActiveRecord::Migration[5.2]
  def change
    remove_column :schedules, :project, :string
  end
end
