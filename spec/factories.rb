FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com" 
    end
    password { "secretPassword" }
    password_confirmation { "secretPassword" }
  end

  factory :project do
    builder { "Test1" }
    association :user
  end

  factory :crew do
    title {"TestCrew"}
    association :user
  end

  factory :equipment do
    title {"TestEquip"}
    association :user
  end

  factory :task do
    title {"TestTask"}
    association :user
  end
end
