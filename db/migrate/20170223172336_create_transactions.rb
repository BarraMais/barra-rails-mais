class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :advertiser, foreign_key: true
      t.references :ad, foreign_key: true

      t.timestamps
    end
  end
end
