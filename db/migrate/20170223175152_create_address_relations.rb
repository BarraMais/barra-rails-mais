class CreateAddressRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :address_relations do |t|
      t.references :advertiser, foreign_key: true
      t.references :address, foreign_key: true

      t.timestamps
    end
  end
end
