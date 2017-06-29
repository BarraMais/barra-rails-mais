FactoryGirl.define do
  factory :state do
    name Faker::Address.state
    uf Faker::Address.state_abbr
    country
  end
end
