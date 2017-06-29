class TraveledCountry < ApplicationRecord
  belongs_to :user
  belongs_to :country_for_travel
end
