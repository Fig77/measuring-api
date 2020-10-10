class CreateMeasureItems < ActiveRecord::Migration[6.0]
  def change
    create_table :measure_items do |t|
      t.string :name, :null => false,  unique: true
      t.string :description, :null => false

      t.timestamps
    end
  end
end
