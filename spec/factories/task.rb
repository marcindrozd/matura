FactoryGirl.define do
  factory :task do
    sequence(:number) { |n| n }
    level 'podstawa'
  end
end