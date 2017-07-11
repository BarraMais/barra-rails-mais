class CreateLandlines < ActiveRecord::Migration[5.0]
  def change
    create_table :landlines do |t|
      t.string :number
      t.references :advertiser, foreign_key: true

      t.timestamps
    end
  end
end
