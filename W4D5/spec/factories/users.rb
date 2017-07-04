FactoryGirl.define do
  factory :user do
    user_name { Faker::Internet.user_name }
    password "password"
  end
end
