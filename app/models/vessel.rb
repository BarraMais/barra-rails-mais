class Vessel < ApplicationRecord
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  belongs_to :classified
  belongs_to :vessel_type
  belongs_to :brand
  belongs_to :mold

  has_many :vessel_accessories, dependent: :destroy
  has_many :accessories, through: :vessel_accessories
end
