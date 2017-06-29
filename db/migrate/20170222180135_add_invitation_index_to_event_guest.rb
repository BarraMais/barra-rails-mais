class AddInvitationIndexToEventGuest < ActiveRecord::Migration[5.0]
  def change
    add_index :event_guests, [:guest_id, :event_id], unique: true
  end
end
