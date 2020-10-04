class User < ApplicationRecord
  has_secure_password
  has_many :measurements, dependent: :destroy
  has_one :role, through: :user_role

  validates_presence_of :username, :email, :password_digest
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  validates :password_digest, length: { in: 6..20 }
  validates :username, length: { in: 3..10 }
end
