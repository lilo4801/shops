class User < ApplicationRecord
  has_secure_password
   validates :name,:email,:password,:password_confirmation, presence: true
  validates :password, length: { in: 6..20 }
  validates :name,length: { minimum: 5 }
end
