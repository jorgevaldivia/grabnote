# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :collaborator_join do
    user nil
    collaboratable_id 1
    collaboratable_type "MyString"
  end
end
