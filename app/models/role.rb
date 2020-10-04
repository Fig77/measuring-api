class Role < ApplicationRecord
  before_save :default_values
  has_many :user, through: :user_role

  validates_presence_of :name, :admin

  private

  def default_values
    self.admin ||= false
  end
end
