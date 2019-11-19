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

  private

  def task_params
    params.require(:task).permit(:title, :description)
  end
end
