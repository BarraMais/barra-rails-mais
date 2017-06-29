class AddFishingTouristToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :fishing_tourist, :boolean
  end
end
