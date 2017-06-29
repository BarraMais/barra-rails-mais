class RemoveVesselFromMold < ActiveRecord::Migration[5.0]
  def change
    remove_reference :molds, :vessel, foreign_key: true
  end
end
