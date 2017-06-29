class AddMinorChangesToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nautical_literature, :text
    add_column :users, :nautical_application, :text
    add_column :users, :nautical_brand, :text
    add_column :users, :cruise_trips, :text
  end
end
