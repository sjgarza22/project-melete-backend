class UserSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :email, :password, :name, :bio, :github, :twitter, :website
end