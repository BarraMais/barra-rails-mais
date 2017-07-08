class AddColumnToPhone < ActiveRecord::Migration[5.0]
  def change
    add_column :phones, :phone_type, :integer
  end
end
