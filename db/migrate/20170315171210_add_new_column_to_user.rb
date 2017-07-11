class AddNewColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :naval_service_patent, :integer
  end
end
