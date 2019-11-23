class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :company_name,        null: false, default: ""
      t.string :company_address,     null: false, default: ""
      t.string :city,                null: false, default: ""
      t.string :state,               null: false, default: ""
      t.string :zip_code,            null: false, default: ""
      t.string :email,               null: false, default: ""

      t.timestamps
    end
    add_index :organizations, :company_name,  unique: true
  end
end
