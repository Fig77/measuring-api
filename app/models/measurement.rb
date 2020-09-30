class Measurement < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'users_id'
  belongs_to :measure_item, class_name: 'MeasureItem', foreign_key: 'measure_items_id'

  validates_presence_of :value
  validates_numericality_of :value, greater_than: 0
end
