class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.date :event_date
      t.references :address, foreign_key: true

      t.timestamps
    end
  end
end
