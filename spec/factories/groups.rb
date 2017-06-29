FactoryGirl.define do
  factory :group do
    about Faker::Lorem.paragraph

    trait :valid do
      user
      name Faker::Name.name
    end

    trait :invalid do
      user nil
      name ""
    end

    factory :valid_group, traits: [:valid]
    factory :invalid_group, traits: [:invalid]

  end
end
