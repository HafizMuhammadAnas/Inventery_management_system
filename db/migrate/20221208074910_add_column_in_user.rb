class AddColumnInUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :role, :string
    add_column :users, :contect_number, :string
  end
end
