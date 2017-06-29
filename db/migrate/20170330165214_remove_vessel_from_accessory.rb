class RemoveVesselFromAccessory < ActiveRecord::Migration[5.0]
  def change
    remove_reference :accessories, :vessel, foreign_key: true
  end
end
