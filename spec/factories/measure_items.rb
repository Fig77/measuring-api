FactoryBot.define do
  factory :measure_item do
    name { Faker::Name.name }
    description { Faker::Name.name }
  end
end
