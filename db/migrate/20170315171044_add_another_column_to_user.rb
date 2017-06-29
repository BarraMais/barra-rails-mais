class AddAnotherColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :naval_service, :integer
  end
end
