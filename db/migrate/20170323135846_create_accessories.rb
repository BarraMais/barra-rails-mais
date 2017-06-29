class CreateAccessories < ActiveRecord::Migration[5.0]
  def change
    create_table :accessories do |t|
      t.integer :accessory_type
      t.integer :name
      t.references :classified, foreign_key: true
      t.references :vessel, foreign_key: true

      t.timestamps
    end
  end
end
