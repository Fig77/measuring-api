class AddMeasureItemsToMeasurements < ActiveRecord::Migration[6.0]
  def change
    add_reference :measurements, :measure_item, foreign_key: true 
  end
end
