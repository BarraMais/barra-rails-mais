class AddFieldToAd < ActiveRecord::Migration[5.0]
  def change
    add_column :ads, :area, :integer
  end
end
