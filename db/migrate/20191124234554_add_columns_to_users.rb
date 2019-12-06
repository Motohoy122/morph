class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :company_id, :integer
    add_column :users, :user_type, :integer
  end
end
