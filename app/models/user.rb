class User < ApplicationRecord
  has_many :child, dependent: :destroy
end
