class RemoveEventFromAddress < ActiveRecord::Migration[5.0]
  def change
    remove_reference :addresses, :event, foreign_key: true
  end
end
