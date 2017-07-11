class CreateUserNauticalSports < ActiveRecord::Migration[5.0]
  def change
    create_table :user_nautical_sports do |t|
      t.references :user, foreign_key: true
      t.references :nautical_sport, foreign_key: true

      t.timestamps
    end
  end
end
