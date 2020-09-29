class User < ApplicationRecord
  has_secure_password

  validates_presence_of :username, :email, :password_digest
  validates_uniquness_of :username, :email
end
