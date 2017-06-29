class StateForTravel < ApplicationRecord
  has_many :traveled_states
  has_many :users, :through => :traveled_states
end
