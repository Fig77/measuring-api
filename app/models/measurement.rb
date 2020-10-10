class Measurement < ApplicationRecord
  belongs_to :user
  belongs_to :measure_item

  validates_presence_of :value
  validates_numericality_of :value, greater_than: 0
end
