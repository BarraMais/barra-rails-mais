class CreateTraveledStates < ActiveRecord::Migration[5.0]
  def change
    create_table :traveled_states do |t|
      t.references :user, foreign_key: true
      t.references :state_for_travel, foreign_key: true

      t.timestamps
    end
  end
end
