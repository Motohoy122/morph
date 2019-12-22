class CrewsController < ApplicationController
  
  def index
    @crews = Crew.all
  end

  def show
    @crew = Crew.find(params[:id])
  end

end
