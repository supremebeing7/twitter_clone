# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username Faker::Internet.user_name
    password 'password'
    password_confirmation 'password'
    email Faker::Internet.email
  end
end
