class UserProjectsController < ApplicationController
    def index
        user_projects = UserProject.all
        render json: UserProjectSerializer.new(user_projects).serialized_json
    end

    def new
        user_project = UserProject.new
    end

    def create
        user_project = UserProject.create(user_id: user_project_params[:user_id], project_id: user_project_params[:project_id], link: user_project_params[:link])

        if user_project.valid?
            render json: UserProjectSerializer.new(user_project).serialized_json, status: :accepted
        else
            render json: { message: 'Could not save new project' }, status: :unaccepted
        end
    end

    def show
        user_project = UserProject.find_by_id(params['id'])

        if user_project
            render json: UserProjectSerializer.new(user_project).serialized_json, status: :accepted
        else
            render json: { message: 'Could not find project' }, status: :not_found
        end
    end

    def destroy
        user_project = UserProject.find_by_id(params['id'])

        if user_project.destroy
            render json: ProjectSerializer.new(user_project).serialized_json, status: :accepted
        else
            render json: { message: 'Could not find project' }, status: :not_found
        end
    end

    private

    def user_project_params
        params.require(:projects).permit(:project_id, :user_id, :link)
    end
end
