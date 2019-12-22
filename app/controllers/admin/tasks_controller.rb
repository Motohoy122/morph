class Admin::TasksController < ApplicationController
  before_action :authenticate_user!
  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.create(task_params)
    if @task.valid?
      redirect_to schedules_path(@task)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find_by_id(params[:id])
    if @task.blank?
      render plain: 'Not Found :(', status: :not_found
    end
  end

  def update
    @task = Task.find_by_id(params[:id])
    return render_not_found if @task.blank?

    current_task.update_attributes(task_params)

    if @task.valid?
      render plain: 'updated!'
    else
      return render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find_by_id(params[:id])
    return render_not_found if @task.blank?
    @task.destroy
    redirect_to root_path
  end

  private

  def current_task
    @current_task ||= Task.find(params[:id])
  end 

  def task_params
    params.require(:task).permit(:title, :description, :row_order_position)
  end
end
