class Project < ApplicationRecord
  has_many :schedules
  belongs_to :user

  validates :job_name, presence: true
end
