class AddWaterSportToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :water_sport, :integer
  end
end
