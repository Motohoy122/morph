class Admin::EquipmentController < ApplicationController
  before_action :authenticate_user!

  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = current_user.equipment.create(equipment_params)
    if @equipment.valid?
      redirect_to schedules_path(@task)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @equipment = Equipment.find_by_id(params[:id])
    if @equipment.blank?
      render plain: 'Not Found :(', status: :not_found
    end
  end

  def update
    @equipment = Equipment.find_by_id(params[:id])
    return render_not_found if @equipment.blank?

    current_equipment.update_attributes(equipment_params)

    if @equipment.valid?
      render plain: 'updated!'
    else
      return render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @equipment = Equipment.find_by_id(params[:id])
    return render_not_found if @equipment.blank?
    @equipment.destroy
    redirect_to root_path
  end

  private
  def current_equipment
    @current_equipment ||= Crew.find(params[:id])
  end 

  def equipment_params
    params.require(:equipment).permit(:title, :description, :row_order_position)
  end
end
