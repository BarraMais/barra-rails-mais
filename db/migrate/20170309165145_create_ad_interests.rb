class CreateAdInterests < ActiveRecord::Migration[5.0]
  def change
    create_table :ad_interests do |t|
      t.references :ad, foreign_key: true
      t.references :interest_area, foreign_key: true

      t.timestamps
    end
  end
end
