class CreateExports < ActiveRecord::Migration[5.2]
  def change
    create_table :exports do |t|
      t.string :name
      t.string :status
      t.timestamps
    end
  end
end
