class AddLicenseInterestToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :license_interest, :integer
  end
end
