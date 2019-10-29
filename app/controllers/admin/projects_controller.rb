class Admin::ProjectsController < ApplicationController
  before_action :authenticate_user!

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.create(project_params)
    if @project.valid?
      redirect_to admin_project_path(@project)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def project_params
    params.require(:project).permit(:job_name)
  end
end
