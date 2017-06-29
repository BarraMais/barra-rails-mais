class Product < ApplicationRecord
  belongs_to :classified
  belongs_to :product_category
  belongs_to :product_sub_category
  belongs_to :product_sub_category2
end
