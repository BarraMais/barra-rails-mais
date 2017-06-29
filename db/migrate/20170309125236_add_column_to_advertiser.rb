class AddColumnToAdvertiser < ActiveRecord::Migration[5.0]
  def change
    add_reference :advertisers, :address, foreign_key: true
  end
end
