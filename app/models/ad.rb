class Ad < ApplicationRecord
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  has_many :ad_interests, dependent: :destroy
  has_many :interest_areas, through: :ad_interests

  has_many :transactions, dependent: :destroy

  enum area: [:blog_medium, :blog_large, :home, :lateral, :lateral_small, :timeline_post]
end
