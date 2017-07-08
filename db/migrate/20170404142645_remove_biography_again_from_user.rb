class RemoveBiographyAgainFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :biography, :text
  end
end
