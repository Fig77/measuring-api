require 'rails_helper'

RSpec.describe 'Measurements', type: :request do
  let!(:measure_item) { create(:measure_item) }
  let(:user) { create(:user) }
  let!(:measurements) { create_list(:measurement, 20, measure_item: measure_item, user: user) }
  let(:type_id) { measure_item.id }
  let(:measurement_id) { measurements.first.id }
  let(:headers) { valid_headers }

  describe 'GET measure_item/measure_item_id/measurements' do
    before { get '/measurements', params: {}, headers: headers }

    it 'Should return 20 items' do
      expect(json).not_to be_empty
      expect(json.size).to eq(20)
    end

    it 'Returns a 200 response' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET measurements/measurement_id' do
    before { get "/measurements/#{measurement_id}", params: {}, headers: headers }

    it 'Should return a valid measurement' do
      expect(json).not_to be_empty
      expect(json['value']).to eq(2)
    end

    it 'Returns a 200 response' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /measurements' do
    let(:valid_attributes) { { value: 2, comment: 'I so pale', measure_item_id: type_id }.to_json }

    context 'when the request is valid' do
      before { post '/measurements', params: valid_attributes, headers: headers }

      it 'Create new measure' do
        expect(json['value']).to eq(2)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'invalid request' do
      let(:invalid_attributes) { { comment: 'you are on air' }.to_json }
      before { post '/measurements/', params: invalid_attributes, headers: headers }

      it 'Shoudl return status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT /measurements/measurement_id' do
    let(:valid_attributes) { { value: 7, comment: 'Today snow is criplling [...]', measure_item_id: type_id }.to_json }

    context 'valid request' do
      before { put "/measurements/#{measurement_id}", params: valid_attributes, headers: headers }

      it 'Should update content' do
        expect(response.body).to be_empty
      end

      it 'should return status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /measurements/measujrement_id' do
    before { delete "/measurements/#{measurement_id}", params: {}, headers: headers }

    it 'should return status code 204' do
      expect(response).to have_http_status(204)
    end

    it 'should not find the record' do
      get "/measurements/#{measurement_id}", params: {}, headers: headers

      expect(response).to have_http_status(404)
    end
  end
end
