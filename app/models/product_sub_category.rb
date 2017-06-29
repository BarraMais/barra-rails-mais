class ProductSubCategory < ApplicationRecord
  belongs_to :product_category

  has_many :product_sub_category_2
  has_many :products
end
