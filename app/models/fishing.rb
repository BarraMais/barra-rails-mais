class Fishing < ApplicationRecord
  belongs_to :classified
  belongs_to :fishing_category
  belongs_to :fishing_sub_category
end
