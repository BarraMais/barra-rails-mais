class RenameUserToGuest < ActiveRecord::Migration[5.0]
  def change
    rename_column :event_guests, :user_id, :guest_id
  end
end
