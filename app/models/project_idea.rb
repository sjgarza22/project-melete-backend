class ProjectIdea < ApplicationRecord
    belongs_to :user

    validates :title, presence: true, uniqueness: true
    validates :details, presence: true
    validates :user_id, presence: true
end
