class Checklist < ApplicationRecord
  belongs_to :child

  has_one :medicine
end
