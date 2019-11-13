class Admin::CrewsController < ApplicationController
  def new
    @crew = Crew.new
  end

  def create
    @crew = Crew.create(crew_params)
    redirect_to root_path
  end

  private

  def crew_params
    params.require(:crew).permit(:title, :description)
  end
end
