class AddEquipmentIdColumnToEquipment < ActiveRecord::Migration[5.2]
  def change
    add_column :equipment, :equipment_id, :integer
  end
end
