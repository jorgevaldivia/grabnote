# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do


  factory :activity do
    user
    project
    trackable nil

    after(:create) do |activity|
      project.activities << activity
    end
  end

  factory :project_comment, :class => 'Project::Comment' do
    user nil
    project nil
    body "test comment"

    after(:create) do |comment|
      create(:activity, trackable: comment)
    end
  end

  factory :project_upload, :class => 'Project::Upload' do
    user nil
    project nil

    after(:create) do |upload|
      create(:activity, trackable: upload)
    end
  end

  factory :project do
    user
    name "test_project"
    id 1
  end
end
