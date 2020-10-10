class CreateMeasurements < ActiveRecord::Migration[6.0]
  def change
    create_table :measurements do |t|
      t.float :value, :null => false
      t.string :comment

      t.timestamps
    end
  end
end
