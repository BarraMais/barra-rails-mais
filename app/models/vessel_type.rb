class VesselType < ApplicationRecord
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

  def as_json(options = { })
    h = super(options)
    h[:photo_url]   = ApplicationController.helpers.asset_url(photo.url)
    h
  end

  has_many :brands
  has_many :vessels
end
