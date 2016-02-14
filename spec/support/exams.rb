FactoryGirl.define do
  factory :exam do
    sequence(:name) { |n| "exam#{n}" }
  end
end
