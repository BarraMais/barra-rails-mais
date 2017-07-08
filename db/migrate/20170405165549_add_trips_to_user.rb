class AddTripsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :national_trips, :text
    add_column :users, :international_trips, :text
  end
end
