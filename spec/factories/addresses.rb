FactoryGirl.define do
  factory :address do

    street Faker::Address.street_name
    complement Faker::Address.secondary_address
    neighborhood Faker::Address.city_suffix
    city
    state
    country
    zip_code Faker::Address.zip_code

  end
end
