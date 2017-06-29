class CreateFishingSubCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :fishing_sub_categories do |t|
      t.string :name
      t.references :fishing_category, foreign_key: true

      t.timestamps
    end
  end
end
