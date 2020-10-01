require 'rails_helper'

RSpec.describe 'Measurements', type: :request do
  let!(:measure_item) { create(:measure_item) }
  let!(:measurements) { create_list(:measurements, 20, measure_items_id: measure_item.id) }
  let(:type_id) { measue_item.id }
  let(:measurement_id) { measurement.first.id }

  describe 'GET measure_item/measure_item_id/measurement_id' do
    before { "get measure_items/#{type_id}/#{measurement_id}" }
    it 'Returns a 200 response' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST measure_item/measure_item_id/measurement_id' do
    before { "post measure_items/#{type_id}/#{measurement_id}" }
    it 'Returns a 200 response' do
      expect(response).to have_http_status(200)
    end
  end
end
