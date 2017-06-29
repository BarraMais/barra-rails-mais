class ProductSubCategory2 < ApplicationRecord
  belongs_to :product_sub_category

  has_many :products
end
