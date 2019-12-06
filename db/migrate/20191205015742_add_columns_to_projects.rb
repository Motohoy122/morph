class AddColumnsToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :builder, :string
    add_column :projects, :lots, :integer
    add_column :projects, :supervisor, :string
    add_column :projects, :our_super, :string
    add_column :projects, :phone, :string
    add_column :projects, :email, :string
    add_column :projects, :address, :string
    add_column :projects, :city, :string
    add_column :projects, :state, :string
    add_column :projects, :zip, :string
  end
end
