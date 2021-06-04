class ProjectIdeaSerializer
    include FastJsonapi::ObjectSerializer
    attributes :title, :details, :status, :user_id

    belongs_to :user
end