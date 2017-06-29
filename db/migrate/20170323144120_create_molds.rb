class CreateMolds < ActiveRecord::Migration[5.0]
  def change
    create_table :molds do |t|
      t.string :name
      t.references :brand, foreign_key: true
      t.references :vessel, foreign_key: true

      t.timestamps
    end
  end
end
