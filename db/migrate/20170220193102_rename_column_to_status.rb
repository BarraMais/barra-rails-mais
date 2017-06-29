class RenameColumnToStatus < ActiveRecord::Migration[5.0]
  def change
    rename_column :event_guests, :accepted, :status
  end
end
