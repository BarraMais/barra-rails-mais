FactoryGirl.define do
  factory :comment do
    user nil

    trait :valid do
      description Faker::Lorem.paragraph
    end

    trait :invalid_no_text do
      description ""
      post
    end

    trait :invalid_no_post do
      description Faker::Lorem.paragraph
      post nil
    end

    factory :valid_comment, traits: [:valid]
    factory :invalid_comment, traits: [:invalid_no_text]
    factory :invalid_post_comment, traits: [:invalid_no_post]
  end
end
