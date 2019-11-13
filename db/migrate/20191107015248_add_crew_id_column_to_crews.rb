class AddCrewIdColumnToCrews < ActiveRecord::Migration[5.2]
  def change
    add_column :crews, :crew_id, :integer
  end
end
