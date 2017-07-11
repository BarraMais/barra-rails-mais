class ChangeNameFromAccessory < ActiveRecord::Migration[5.0]
  def change
    change_column :accessories, :name, :string
  end
end
