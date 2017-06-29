class RemoveBiographyFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :biography, :string
  end
end
