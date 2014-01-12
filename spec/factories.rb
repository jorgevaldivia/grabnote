FactoryGirl.define do

  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    email { generate :email }
    first_name ::Forgery::Name.first_name
    last_name ::Forgery::Name.last_name
    password "abc123Abc!"
  end
end