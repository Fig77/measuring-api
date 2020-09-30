class Measurement < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'users_id'
  belongs_to :measure_item, class_name: 'MeasureItem', foreign_key: 'measure_items_id'
end
