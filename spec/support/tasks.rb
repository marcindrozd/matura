FactoryGirl.define do
  factory :task do
    exam
    number (1..5).to_a.sample
    level Task::LEVELS.sample
    skill Task::SKILLS.sample
  end
end
