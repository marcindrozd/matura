FactoryGirl.define do
  factory :student do
    sequence(:name) { |n| "Uczeń #{n}"}
  end

  factory :user do
    first_name 'Test'
    last_name 'User'
    sequence(:username) { |u| "username#{u}" }
    sequence(:email) { |e| "email#{e}@example.com" }
    password 'password'
    role 'teacher'
  end
end
