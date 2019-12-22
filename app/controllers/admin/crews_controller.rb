class Admin::CrewsController < ApplicationController
  before_action :authenticate_user!

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

  def edit
    @crew = Crew.find_by_id(params[:id])
    if @crew.blank?
      render plain: 'Not Found :(', status: :not_found
    end
  end

  def update
    @crew = Crew.find_by_id(params[:id])
    return render_not_found if @crew.blank?

    @crew.update_attributes(crew_params)

    if @crew.valid?
      redirect_to root_path
    else
      return render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @crew = Crew.find_by_id(params[:id])
    return render_not_found if @crew.blank?
    @crew.destroy
    redirect_to root_path
  end

  private

  def crew_params
    params.require(:crew).permit(:title, :description)
  end
end
