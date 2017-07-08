class Address < ApplicationRecord

  belongs_to :city
  belongs_to :state
  belongs_to :country

  def city_name
    city_id.name
  end

  def state_name
    state_id.name
  end

  def state_uf
    state_id.uf
  end
end
