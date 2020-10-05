require 'rails_helper'
RSpec.describe 'MeasureItems', type: :request do
  let(:user) { create(:user_role).user }
  let!(:measure_item) { create_list(:measure_item, 6) }
  let(:measure_id) { MeasureItem.first.id }
  let(:headers) { valid_headers }

  describe 'GET /measure_items' do
    before { get '/measure_items', params: {}, headers: headers }
    it 'Returns items to measure' do
      expect(json).not_to be_empty
      expect(json.size).to eq(6)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /measure_items/items' do
    before { get "/measure_items/#{measure_id}", params: {}, headers: headers }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'Returns particular measure item from all the measure types' do
      expect(json).not_to be_empty
      expect(json['id']).to eq(measure_id)
    end
  end

  describe 'GET /measure_items/items when item does not exist' do
    before { get '/measure_items/52342', params: {}, headers: headers }
    it 'return status code 404' do
      expect(response).to have_http_status(404)
    end
  end

  context 'when user is not an admin' do
    describe 'POST /admin/measure_items shoud return validation error' do
      before { post '/admin/measure_items', params: {}, headers: headers }

      it 'returns status code 403' do
        expect(response).to have_http_status(403)
      end

      it 'expects to return unauthorized request' do
        expect(json['message']).to match(/Forbidden/)
      end
    end

    describe 'PUT /admin/measure_items/:id should return validation error' do
      before { put "/admin/measure_items/#{measure_id}", params: {}, headers: headers }

      it 'returns status code 403' do
        expect(response).to have_http_status(403)
      end
    end

    describe 'DELETE /admin/measure_items/:id should return validation error' do
      before { delete "/admin/measure_items/#{measure_id}", params: {}, headers: headers }

      it 'returns status code 403' do
        expect(response).to have_http_status(403)
      end
    end
  end
end
