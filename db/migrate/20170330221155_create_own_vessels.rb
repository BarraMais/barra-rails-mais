class CreateOwnVessels < ActiveRecord::Migration[5.0]
  def change
    create_table :own_vessels do |t|
      t.references :user, foreign_key: true
      t.references :vessel_type, foreign_key: true
      t.index [:user_id, :vessel_type_id], unique: true

      t.timestamps
    end
  end
end
