class Accessory < ApplicationRecord
  has_many :vessel_accessories, dependent: :destroy
  has_many :vessels, through: :vessel_accessories
end
