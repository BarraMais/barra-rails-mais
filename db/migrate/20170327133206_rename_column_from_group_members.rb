class RenameColumnFromGroupMembers < ActiveRecord::Migration[5.0]
  def change
    rename_column :group_members, :user_id, :member_id
  end
end
