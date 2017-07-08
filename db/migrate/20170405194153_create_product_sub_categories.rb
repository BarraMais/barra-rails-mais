class CreateProductSubCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :product_sub_categories do |t|
      t.string :name
      t.references :product_category, foreign_key: true

      t.timestamps
    end
  end
end
