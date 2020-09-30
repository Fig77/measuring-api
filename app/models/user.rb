class User < ApplicationRecord
  has_secure_password
  has_many :measurements, dependent: :destroy

  validates_presence_of :username, :email, :password_digest
  validates_uniqueness_of :username, :email
  validates :password_digest, length: { in: 6..20 }
  validates :username, length: { in: 3..10 }
end
