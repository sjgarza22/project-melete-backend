class Project < ApplicationRecord
    belongs_to :user
    has_many :user_projects

    validates :title, presence: true, uniqueness: true
    validates :details, presence: true
    validates :user_id, presence: true
    validates :status, presence: true
end
