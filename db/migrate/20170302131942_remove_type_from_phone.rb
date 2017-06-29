class RemoveTypeFromPhone < ActiveRecord::Migration[5.0]
  def change
    remove_column :phones, :type, :integer
  end
end
