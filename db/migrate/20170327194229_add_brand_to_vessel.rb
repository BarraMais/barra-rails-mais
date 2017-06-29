class AddBrandToVessel < ActiveRecord::Migration[5.0]
  def change
    add_reference :vessels, :brand, foreign_key: true
  end
end
