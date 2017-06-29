class RemoveManufacturerFromVessel < ActiveRecord::Migration[5.0]
  def change
    remove_column :vessels, :manufacturer, :string
  end
end
