FactoryBot.define do
  factory :user_role do
    role_id { create(:role) }
    user_id { create(:user) }
  end
end
