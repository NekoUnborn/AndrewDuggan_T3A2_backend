class User < ApplicationRecord
  has_secure_password
  
  has_many :child, dependent: :destroy
end
