class ChangeProjectToBeStringInSchedules < ActiveRecord::Migration[5.2]
  def change
    change_column :schedules, :project, :string
  end
end
