class AddFieldToAdvertiser < ActiveRecord::Migration[5.0]
  def change
    add_reference :advertisers, :user, foreign_key: true
  end
end
