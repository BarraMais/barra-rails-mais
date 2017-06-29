class FishingCategory < ApplicationRecord
  has_many :fishing_sub_categories
  has_many :fishings
end
