class User < ApplicationRecord
  has_secure_password

  has_many :user_projects
  has_many :projects
  has_many :project_ideas

  validates :email, presence: true, uniquness: true
  validates :username, presence: true, uniquness: true
end
