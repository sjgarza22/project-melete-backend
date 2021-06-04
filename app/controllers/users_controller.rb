class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
    def create
        @user = User.create(user_params)
        if @user.valid?
            @token = encode_token(user_id: @user.id)
            render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    def show
        user = User.find_by_id(params['id'])

        if user
            render json: { user: UserSerializer.new(user) }, status: :found
        else
            render json: { error: 'failed to find user' }, status: :not_found
        end
    end

    def destroy
        user = User.find_by_id(params['id'])

        if user.destroy
            render json: UserSerializer.new(user).serialized_json
        else
            render json: { message: "User could not be found" }
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :username, :password, :name, :bio, :github, :twitter, :website)
    end
end