class UserProject < ApplicationRecord
    belongs_to :user
    belongs_to :project

    validates :project_id, presence: true
    validates :user_id, presence: true
    validates :link, presence: true
end
