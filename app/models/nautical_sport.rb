class NauticalSport < ApplicationRecord
  has_many :user_nautical_sports, dependent: :destroy
  has_many :users, :through => :user_nautical_sports

  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  
end
