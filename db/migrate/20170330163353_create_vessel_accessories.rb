class CreateVesselAccessories < ActiveRecord::Migration[5.0]
  def change
    create_table :vessel_accessories do |t|
      t.references :vessel, foreign_key: true
      t.references :accessory, foreign_key: true

      t.timestamps
    end
  end
end
