FactoryBot.define do
  factory :user_role do
    role_id { create(:role).id }
    user_id { create(:user).id }

    trait :admin do
      role_id { create(:role, :admin).id }
      user_id { create(:user, :admin).id }
    end
  end
end
