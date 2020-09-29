require 'rails_helper' # rubocop:disable Layout/EndOfLine

RSpec.describe User, type: :model do
  it { should have_secure_password }
  it { should validate_presence_of(:username).on(:create) }
  it { should validate_presence_of(:email).on(:create) }
  # TODO
  # password should have plus 6 lencgth.Email should have format matching an email
  # password shoulkd have at least one number.
end
