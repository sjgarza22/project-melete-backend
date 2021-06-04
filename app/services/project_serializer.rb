class ProjectSerializer
    include FastJsonapi::ObjectSerializer
    attributes :title, :details, :user_id

    belongs_to :user
end