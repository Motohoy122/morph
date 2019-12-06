class Admin::SchedulesController < ApplicationController
  before_action :authenticate_user!

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.create(schedule_params)
    if @schedule.valid?
      redirect_to schedules_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  private

  def schedule_params
    params.require(:schedule).permit(:project_id, :location, :lot_count)
  end
end
