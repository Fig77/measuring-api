require 'rails_helper'

RSpec.describe MeasureItem, type: :model do
  subject { create(:measure_item) }
  it { should have_many(:measurements) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
