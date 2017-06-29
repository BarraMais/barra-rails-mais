class VesselAccessory < ApplicationRecord
  belongs_to :vessel
  belongs_to :accessory
end
