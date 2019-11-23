class User < ApplicationRecord
  has_many :projects
  has_many :tasks
  has_many :equipment
  has_many :crews
  has_many :my_groups
  belongs_to :organization

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
