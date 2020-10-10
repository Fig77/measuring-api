require 'rails_helper'
RSpec.describe Measurement, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:measure_item) }
  it { should validate_presence_of(:value) }
  it { should validate_numericality_of(:value).is_greater_than(0) }
end
