require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user) }
  it { should have_secure_password }
  it { should validate_presence_of(:username).on(:create) }
  it { should validate_presence_of(:email).on(:create) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:email) }

  it do
    should validate_length_of(:password).is_at_least(6).is_at_most(20)
  end
  it do
    should validate_length_of(:username).is_at_least(3).is_at_most(10)
  end

  # validates relations

  it { should have_many :measurements }
  # it { should have_many :measurement }
end
