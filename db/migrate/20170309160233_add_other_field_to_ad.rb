class AddOtherFieldToAd < ActiveRecord::Migration[5.0]
  def change
    add_reference :ads, :interest_area, foreign_key: true
  end
end
