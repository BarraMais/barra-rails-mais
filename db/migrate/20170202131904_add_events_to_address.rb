class AddEventsToAddress < ActiveRecord::Migration[5.0]
  def change
    add_reference :addresses, :event, foreign_key: true
  end
end
