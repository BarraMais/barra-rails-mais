class AddReferenceToVessel < ActiveRecord::Migration[5.0]
  def change
    add_reference :vessels, :vessel_type, foreign_key: true
  end
end
