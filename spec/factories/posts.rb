FactoryGirl.define do
  factory :post do
    trait :valid do
      description Faker::Lorem.paragraph
    end

    trait :invalid_no_text do
      description ""
    end

    factory :valid_post, traits: [:valid]
    factory :invalid_post, traits: [:invalid_no_text]
  end
end
