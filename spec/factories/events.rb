FactoryGirl.define do
  factory :event do
    about Faker::Lorem.paragraph

    trait :valid do
      user
      address
      name Faker::Name.name
      event_date {Date.tomorrow}
    end

    trait :invalid do
      user nil
      address nil
      name ""
      event_date ""
    end

    factory :valid_event, traits: [:valid]
    factory :invalid_event, traits: [:invalid]

  end
end
