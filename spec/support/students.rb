FactoryGirl.define do
  factory :student do
    group
    sequence(:name) { |n| "Student #{n}"}
    level { %w(standard extended bilingual).sample }
  end
end
