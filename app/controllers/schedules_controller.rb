class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
    @tasks = Task.all
    @crews = Crew.all
    @equipment = Equipment.all
  end 
end
