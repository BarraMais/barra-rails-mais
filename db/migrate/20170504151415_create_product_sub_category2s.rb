class CreateProductSubCategory2s < ActiveRecord::Migration[5.0]
  def change
    create_table :product_sub_category2s do |t|
      t.string :name
      t.references :product_sub_category, foreign_key: true

      t.timestamps
    end
  end
end
