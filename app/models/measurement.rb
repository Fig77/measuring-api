class Measurement < ApplicationRecord
  belongs_to :user
  belongs_to :measure_item

  scope :today, -> { where('date >= ?', Time.zone.now.beginning_of_day) }

  validates_presence_of :value
  validates_numericality_of :value, greater_than: 0
end
