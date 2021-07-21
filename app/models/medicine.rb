class Medicine < ApplicationRecord
  has_many :checklists
  validates :name, presence: true
  validates :description, presence: true
end
