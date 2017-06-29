class Mold < ApplicationRecord
  belongs_to :brand

  has_many :vessels
end
