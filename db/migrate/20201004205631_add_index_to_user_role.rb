class AddIndexToUserRole < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_roles, :user, foreign_key: true 
    add_reference :user_roles, :role, foreign_key: true 
  end
end
