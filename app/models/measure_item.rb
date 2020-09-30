class MeasureItem < ApplicationRecord
  has_many :measurements, dependent: :destroy

  validates_presence_of :name
  validates :name, uniqueness: true
end