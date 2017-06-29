class RemoveVesselTypeFromVessel < ActiveRecord::Migration[5.0]
  def change
    remove_column :vessels, :vessel_type, :integer
  end
end
