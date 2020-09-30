class AddForeignKeyToMeasurment < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :measurements, :users
    add_foreign_key :measurements, :measure_items
  end
end
