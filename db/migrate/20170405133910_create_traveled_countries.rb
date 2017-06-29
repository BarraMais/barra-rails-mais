class CreateTraveledCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :traveled_countries do |t|
      t.references :user, foreign_key: true
      t.references :country_for_travel, foreign_key: true

      t.timestamps
    end
  end
end
