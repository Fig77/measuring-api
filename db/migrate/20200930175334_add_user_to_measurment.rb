class AddUserToMeasurment < ActiveRecord::Migration[6.0]
  def change
    add_reference :measurements, :user, foreign_key: true
  end
end