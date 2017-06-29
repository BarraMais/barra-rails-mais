class CreateVessels < ActiveRecord::Migration[5.0]
  def change
    create_table :vessels do |t|
      t.integer :vessel_type
      t.integer :status
      t.string :manufacturer
      t.string :manufacturation_year
      t.string :activation_year
      t.boolean :alienated
      t.string :chassis_number
      t.references :classified, foreign_key: true

      t.timestamps
    end
  end
end
