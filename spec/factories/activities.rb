# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
    user nil
    project nil
    action "MyString"
    trackable nil
  end
end
