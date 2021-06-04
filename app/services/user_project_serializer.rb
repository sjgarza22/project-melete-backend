class UserProjectSerializer
    include FastJsonapi::ObjectSerializer
    attributes :project_id, :user_id, :link

    belongs_to :user
    belongs_to :project
end