class ProjectsController < ApplicationController
    def index
        projects = Project.all
        render json: ProjectSerializer.new(projects).serialized_json
    end

    def new
        project = Project.new
    end

    def create
        project = Project.create(title: project_params[:title], details: project_params[:details], user_id: project_params[:user_id])

        if project.valid?
            render json: ProjectSerializer.new(project).serialized_json, status: :accepted
        else
            render json: { message: 'Could not save new project' }, status: :unaccepted
        end
    end

    def show
        project = Project.find_by_id(params['id'])

        if project
            render json: ProjectSerializer.new(project).serialized_json, status: :accepted
        else
            render json: { message: 'Could not find project' }, status: :not_found
        end
    end

    def destroy
        project = Project.find_by_id(params['id'])

        if project.destroy
            render json: ProjectSerializer.new(project).serialized_json, status: :accepted
        else
            render json: { message: 'Could not find project' }, status: :not_found
        end
    end

    private

    def project_params
        params.require(:projects).permit(:title, :details, :user_id)
    end
end
