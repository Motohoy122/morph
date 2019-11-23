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

  def update
    current_task.update_attributes(task_params)
    render plain: 'updated!'
  end

  private

  def current_task
    @current_task ||= Task.find(params[:id])
  end 

  def task_params
    params.require(:task).permit(:title, :description, :row_order_position)
  end
end
