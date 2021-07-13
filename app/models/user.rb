class User < ApplicationRecord
  has_many :childs, dependant: :destroy
end
