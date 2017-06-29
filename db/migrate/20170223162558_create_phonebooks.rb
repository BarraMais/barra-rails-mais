class CreatePhonebooks < ActiveRecord::Migration[5.0]
  def change
    create_table :phonebooks do |t|
      t.references :advertiser, foreign_key: true
      t.references :phone, foreign_key: true

      t.timestamps
    end
  end
end
