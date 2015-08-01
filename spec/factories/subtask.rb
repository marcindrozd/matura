FactoryGirl.define do
  factory :subtask do
    sequence(:name) { |n| "task #{n}" }
    max_points 1

    task
  end
end