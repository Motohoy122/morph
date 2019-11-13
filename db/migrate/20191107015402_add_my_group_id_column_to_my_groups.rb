class AddMyGroupIdColumnToMyGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :my_groups, :my_group_id, :integer
  end
end
