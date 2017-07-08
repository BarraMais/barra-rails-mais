class AddSub2ToProduct < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :product_sub_category2, foreign_key: true
  end
end
