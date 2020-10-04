require 'rails_helper'

RSpec.describe AuthorizedApiRequest do
  let(:user) { create(:user) }
  let(:header) { { 'Authorization' => token_generator(user.id) } }
  subject(:valid_request) { described_class.new(header) }
  subject(:invalid_request) { described_class.new }

  describe '#call' do
    context 'valid request' do
      it 'Returns user obj' do
        usr = valid_request.call
        expect(usr[:user]).to eq(user)
      end
    end
  end
end
