class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.all
    @tasks = Task.all
    @crews = Crew.all
    @equipment = Equipment.all
    @projects = Project.all
    @events = Event.all
  end 
end
