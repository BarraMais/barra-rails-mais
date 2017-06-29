class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nautical_license, :integer
  end
end
