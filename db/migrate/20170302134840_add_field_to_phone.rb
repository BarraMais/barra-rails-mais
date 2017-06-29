class AddFieldToPhone < ActiveRecord::Migration[5.0]
  def change
    add_column :phones, :phone_number, :string
  end
end
