class AddAcceptedToGroupMember < ActiveRecord::Migration[5.0]
  def change
    add_column :group_members, :accepted, :integer
  end
end
