class Classified < ApplicationRecord
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  has_attached_file :photo_a, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo_a, content_type: /\Aimage\/.*\z/

  has_attached_file :photo_b, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo_b, content_type: /\Aimage\/.*\z/

  belongs_to :user

  has_one :vessel, dependent: :destroy
  has_one :fishing, dependent: :destroy
  has_one :product, dependent: :destroy

  # enum document_type: [:cpf, :cnpj]
end
