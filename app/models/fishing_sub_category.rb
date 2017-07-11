class FishingSubCategory < ApplicationRecord
  belongs_to :fishing_category

  has_many :fishings
end
