class AddReferencesToProduct < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :product_category, foreign_key: true
    add_reference :products, :product_sub_category, foreign_key: true
  end
end
