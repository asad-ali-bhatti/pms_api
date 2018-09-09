FactoryGirl.define do
  factory :project do
    title { Faker::Name.first_name }
  end
end