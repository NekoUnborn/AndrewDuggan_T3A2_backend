class ChecklistEntry < ApplicationRecord
  belongs_to :child
  belongs_to :medicine
end
