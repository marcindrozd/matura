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

  factory :exam do
    sequence(:name) { |n| "exam#{n}" }
  end

  factory :group do
    exam
    sequence(:name) { |n| "group#{n}" }
    kind Group::KINDS.sample
  end

  factory :task do
    exam
    number (1..5).to_a.sample
    level Task::LEVELS.sample
    skill Task::SKILLS.sample
  end
end
