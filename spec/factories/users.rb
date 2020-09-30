FactoryBot.define do
  factory :user do
    username { ('a'..'i').to_a.shuffle.join }
    email { Faker::Internet.email }
    password_digest { "foobar" }
  end
end
