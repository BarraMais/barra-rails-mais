class CreateAds < ActiveRecord::Migration[5.0]
  def change
    create_table :ads do |t|
      t.text :description

      t.timestamps
    end
  end
end
