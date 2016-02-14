FactoryGirl.define do 
  factory :group do
    exam
    sequence(:name) { |n| "group#{n}" }
    kind Group::KINDS.sample
  end
end
