class AddOtherColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :has_nautical_license, :integer
  end
end
