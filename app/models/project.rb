class Project < ApplicationRecord
  belongs_to :user
  
  validates :job_name, presence: true
end
