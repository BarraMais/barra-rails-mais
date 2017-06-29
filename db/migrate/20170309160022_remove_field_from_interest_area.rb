class RemoveFieldFromInterestArea < ActiveRecord::Migration[5.0]
  def change
    remove_reference :interest_areas, :ad, foreign_key: true
  end
end
