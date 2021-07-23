class Child < ApplicationRecord
  belongs_to :user

  has_many :rewards, dependent: :destroy
  has_many :checklist_entries, dependent: :destroy
end
