FactoryBot.define do
  factory :user_role do
    role_id { create(:role).id }
    user_id { create(:user).id }
  end
end
