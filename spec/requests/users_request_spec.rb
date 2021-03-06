require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { build(:user) }
  let(:headers) { valid_headers.except('Authorization') }

  describe 'POST /signup' do
    context 'when valid request' do
      before { post '/signup', params: { user: { username: 'foobar', email: 'email@foo.com', password: 'password' } }.to_json, headers: headers } # rubocop:disable Layout/LineLength

      it 'creates a new user' do
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        expect(json['message']).to match('Account created successfully')
      end

      it 'returns an authentication token' do
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { post '/signup', params: { user: { username: '', email: '', password: '' } }.to_json, headers: headers }

      it 'does not create a new user' do
        expect(response).to have_http_status(422)
      end
    end
  end
end
