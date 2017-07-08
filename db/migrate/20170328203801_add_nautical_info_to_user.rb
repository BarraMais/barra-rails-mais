class AddNauticalInfoToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :fishing, :integer, default: 0
    add_column :users, :nautical_tour, :integer, default: 0
  end
end
