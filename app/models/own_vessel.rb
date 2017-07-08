class OwnVessel < ApplicationRecord
  belongs_to :user
  belongs_to :vessel_type

  validates :vessel_type, uniqueness: { scope: :user }
end
