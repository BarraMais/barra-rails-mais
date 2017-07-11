class Advertiser < ApplicationRecord
  belongs_to :user
  belongs_to :address

  has_many :transactions
  has_many :ads, through: :transactions

  # enum document_type: [:cpf, :cnpj]

  def address_street
    address.street
  end

  def address_complement
    address.complement
  end

  def address_zip_code
    address.zip_code
  end

  def address_neighborhood
    address.neighborhood
  end

  def city_name
    address.city_id.name
  end

  def state_name
    address.state_id.name
  end

  def state_uf
    address.state_id.uf
  end
end
