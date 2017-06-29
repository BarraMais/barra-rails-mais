class RemoveFieldFromBrand < ActiveRecord::Migration[5.0]
  def change
    remove_reference :brands, :vessel, foreign_key: true
  end
end
