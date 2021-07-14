class Child < ApplicationRecord
  belongs_to :user

  has_many :rewards, dependent: :destroy
  has_many :checklists, dependent: :destroy
end
