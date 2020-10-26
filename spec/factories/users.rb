FactoryBot.define do
  factory :user do
    username { ('a'..'i').to_a.shuffle.join }
    email { Faker::Internet.email }
    password { 'foobar' }
  end

  trait :admin do
    username { 'Admin' }
    email { 'admin@eladmin.com' }
    password { 'imindanger' }
  end
end
