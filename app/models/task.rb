class Task < ApplicationRecord
  belongs_to :organization

  validates :title, presence: true
end
