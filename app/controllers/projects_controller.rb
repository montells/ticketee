class ProjectsController < ApplicationController
  before_action :set_project, only: %i[update edit show destroy]
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html {redirect_to @project, notice: 'Project has been created.' }
      else
        format.html do
          flash.now[:alert] = 'Project has not been created.'
          render :new, status: :unprocessable_entity
        end
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project has been updated' }
      else
        format.html do
          flash.now[:alert] = "Project has not been updated"
          render :edit, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = 'Project has been deleted.'
    redirect_to projects_path
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
