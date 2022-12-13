class AddColumnToOrderForigen < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :user_id
    add_column :orders, :user_id, :integer, foreign_key: true
  end
end
