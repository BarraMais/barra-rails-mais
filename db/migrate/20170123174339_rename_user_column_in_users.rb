class RenameUserColumnInUsers < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :user_id, :partner_id
  end
end
