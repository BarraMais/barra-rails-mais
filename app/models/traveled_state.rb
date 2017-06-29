class TraveledState < ApplicationRecord
  belongs_to :user
  belongs_to :state_for_travel  
end
