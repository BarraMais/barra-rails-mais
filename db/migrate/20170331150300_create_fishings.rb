class CreateFishings < ActiveRecord::Migration[5.0]
  def change
    create_table :fishings do |t|
      t.integer :status
      t.references :classified, foreign_key: true

      t.timestamps
    end
  end
end
