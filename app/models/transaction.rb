class Transaction < ApplicationRecord
  belongs_to :advertiser
  belongs_to :ad
end
