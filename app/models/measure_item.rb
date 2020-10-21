class MeasureItem < ApplicationRecord
  has_many :measurements, dependent: :destroy

  scope :measuresToday, -> { all.includes(:measurements).today }

  validates_presence_of :name
  validates :name, uniqueness: true
end
