class Brand < ApplicationRecord
  belongs_to :vessel_type

  has_many :molds
  has_many :vessels
end
