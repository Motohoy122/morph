class Admin::CrewsController < ApplicationController
  def new
    @crew = Crew.new
  end

  def create
    @crew = current_user.crews.create(crew_params)
    if @crew.valid?
      redirect_to schedules_path(@task)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def crew_params
    params.require(:crew).permit(:title, :description)
  end
end
