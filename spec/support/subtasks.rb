FactoryGirl.define do
  factory :subtask do
    task
    number (1..5).to_a.sample
    max_points (1..4).to_a.sample
  end
end
