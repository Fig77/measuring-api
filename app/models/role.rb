class Role < ApplicationRecord
  before_save :default_values
  has_many :user, through: :user_role

  private

  def default_values
    self.admin ||= false
  end
end
