class AddWhoStartedToGroupMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :group_members, :who_started, :integer
  end
end
