class RenameGroupsColumnToStatus < ActiveRecord::Migration[5.0]
  def change
    rename_column :group_members, :accepted, :status
  end
end
