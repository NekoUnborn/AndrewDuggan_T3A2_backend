class Child < ApplicationRecord
  belongs_to :user

  has_many :rewards, dependant: :destroy
  has_many :checklists, dependant: :destroy
end
