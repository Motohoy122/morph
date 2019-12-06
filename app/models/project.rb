class Project < ApplicationRecord
  has_many :schedules
  belongs_to :user

  
end
