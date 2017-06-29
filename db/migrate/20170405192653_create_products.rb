class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.references :classified, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
