class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations do |t|
      t.references :recipient, index: true, foreign_key: {to_table: :users}
      t.references :sender, index: true, foreign_key: {to_table: :users}

      t.timestamps

      t.index [:recipient_id, :sender_id], unique: true
    end
  end
end
