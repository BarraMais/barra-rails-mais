class CountryForTravel < ApplicationRecord
  has_many :traveled_countries
  has_many :users, :through => :traveled_countries
end
