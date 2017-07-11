class CreateStateForTravels < ActiveRecord::Migration[5.0]
  def change
    create_table :state_for_travels do |t|
      t.string :name

      t.timestamps
    end
  end
end
