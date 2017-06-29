FactoryGirl.define do
  factory :user do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    cellphone Faker::PhoneNumber.cell_phone
    birthday { 18.years.ago }
    sex ['M', 'F'].sample
    nautical_professional Faker::Boolean.boolean
    academic_profile Faker::Lorem.paragraph
    relationship [0, 1, 2].sample
    partner nil
    about Faker::Lorem.paragraph
    has_embarcation Faker::Boolean.boolean
    nautical_profession_description Faker::Lorem.paragraph
    naval_service Faker::Lorem.paragraph
    email
    password '123456'
  end

   sequence :email do |n|
     "teste#{n}@teste.com"
   end

end
