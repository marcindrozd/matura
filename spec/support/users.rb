FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sequence(:username) { |u| "username#{u}" }
    email { Faker::Internet.email }
    password 'password'
    role 'teacher'
  end
end
