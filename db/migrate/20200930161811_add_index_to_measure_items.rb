class AddIndexToMeasureItems < ActiveRecord::Migration[6.0]
  def change
    add_index :measure_items, :name, unique: true
  end
end
