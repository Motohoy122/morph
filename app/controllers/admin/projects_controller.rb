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

  def edit
    @project = Project.find_by_id(params[:id])
    if @project.blank?
      render plain: 'Not Found :(', status: :not_found
    end
  end

  def update
    @project = Project.find_by_id(params[:id])
    return render_not_found if @project.blank?

    @project.update_attributes(project_params)

    if @project.valid?
      redirect_to root_path
    else
      return render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find_by_id(params[:id])
    return render_not_found if @project.blank?
    @project.destroy
    redirect_to root_path
  end

  private

  def project_params
    params.require(:project).permit(:job_name,:builder,:lots,:supervisor,:our_super,:phone,:email,:address,:city,:state,:zip)
  end
end
