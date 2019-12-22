class AlterCrewsAddRowOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :crews, :row_order, :integer
    add_index :crews, :row_order
  end
end
