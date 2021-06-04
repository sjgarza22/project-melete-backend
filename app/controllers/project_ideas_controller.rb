class ProjectIdeasController < ApplicationController
    def index
        project_ideas = ProjectIdea.all
        render json: ProjectIdeaSerializer.new(project_ideas).serialized_json
    end

    def new
        project_idea = ProjectIdea.new
    end

    def create
        project_idea = ProjectIdea.create(title: project_idea_params[:title], details: project_idea_params[:details], user_id: project_idea_params[:user_id], status: project_idea_params[:status])

        if project_idea.valid?
            render json: ProjectIdeaSerializer.new(project_idea).serialized_json, status: :accepted
        else
            render json: { message: 'Could not save new project' }, status: :unaccepted
        end
    end

    def show
        project_idea = ProjectIdea.find_by_id(params['id'])

        if project_idea
            render json: ProjectIdeaSerializer.new(project_idea).serialized_json, status: :accepted
        else
            render json: { message: 'Could not find project' }, status: :not_found
        end
    end

    def destroy
        project_idea = ProjectIdea.find_by_id(params['id'])

        if project_idea.destroy
            render json: ProjectSerializer.new(project_idea).serialized_json, status: :accepted
        else
            render json: { message: 'Could not find project' }, status: :not_found
        end
    end

    private

    def project_idea_params
        params.require(:projects).permit(:title, :details, :status, :user_id)
    end
end
