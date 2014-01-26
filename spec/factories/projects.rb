# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    user nil
    name "test_project"
    id 1
  end
end
