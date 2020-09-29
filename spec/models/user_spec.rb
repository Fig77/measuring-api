require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_secure_password }
  it { should validate_presence_of(:username).on(:create) }
  it { should validate_presence_of(:email).on(:create) }
end
