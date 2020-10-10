FactoryBot.define do
  factory :role do
    name { 'User' }
    admin { false }

    trait :admin do
      admin { true }
    end
  end
end
