class AddMinorChangesTwoToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :water_sportsman, :boolean
    add_column :users, :fishing_type, :integer
    add_column :users, :tourist_places, :text
  end
end
