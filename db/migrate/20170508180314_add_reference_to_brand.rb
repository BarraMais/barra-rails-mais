class AddReferenceToBrand < ActiveRecord::Migration[5.0]
  def change
    add_reference :brands, :vessel_type, foreign_key: true
  end
end
