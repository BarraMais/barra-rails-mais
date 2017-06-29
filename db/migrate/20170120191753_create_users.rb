class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :cellphone
      t.date :birthday
      t.string :sex
      t.integer :nautical_professional
      t.text :academic_profile
      t.integer :relationship
      t.references :user, foreign_key: true
      t.text :about
      t.integer :has_embarcation
      t.text :nautical_work
      t.text :naval_service

      t.timestamps
    end
  end
end
