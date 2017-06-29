class CreateCountryForTravels < ActiveRecord::Migration[5.0]
  def change
    create_table :country_for_travels do |t|
      t.string :name

      t.timestamps
    end
  end
end
