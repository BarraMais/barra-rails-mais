FactoryGirl.define do
  factory :vessel do
    vessel_type 1
    status 1
    manufacturer "MyString"
    manufacturation_year "MyString"
    activation_year "MyString"
    alienated false
    chassis_number "MyString"
    classified nil
  end
end
