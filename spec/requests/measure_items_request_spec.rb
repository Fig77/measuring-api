require 'rails_helper'
RSpec.describe 'MeasureItems', type: :request do
  let!(:measure_item) { create_list(:measure_item, 6) }
  let(:measure_id) { MeasureItems.first.id }

  describe 'GET /measure_items' do
    before { get '/measure_items' }
    it 'Returns items to measure' do
      expect(json).not_to be_empty
      expect(json.size).to eq(6)
    end
  end
end
