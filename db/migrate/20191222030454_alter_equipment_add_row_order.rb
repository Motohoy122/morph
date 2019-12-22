class AlterEquipmentAddRowOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :equipment, :row_order, :integer
    add_index :equipment, :row_order
  end
end
