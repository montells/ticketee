class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show]

  def index
    @projects = Project.all
  end


  def show
    @project = Project.find(params[:id])
  end

  private

  def set_project
    @project = Project.find params[:id]
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The project you are looking for could not be found."
    redirect_to projects_path
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
