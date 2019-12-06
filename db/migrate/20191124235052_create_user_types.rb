class CreateUserTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :user_types do |t|
      t.string :user_type_name,        null: false

      t.timestamps
    end
    add_index :user_types, :user_type_name,  unique: true
  end
end
