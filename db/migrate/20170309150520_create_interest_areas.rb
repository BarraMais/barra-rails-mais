class CreateInterestAreas < ActiveRecord::Migration[5.0]
  def change
    create_table :interest_areas do |t|
      t.string :name
      t.references :ad, foreign_key: true

      t.timestamps
    end
  end
end
