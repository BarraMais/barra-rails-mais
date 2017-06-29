class AddFieldsToAdvertiser < ActiveRecord::Migration[5.0]
  def change
    add_column :advertisers, :landline, :string
    add_column :advertisers, :cell_phone, :string
  end
end
