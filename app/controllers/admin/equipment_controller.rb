class Admin::EquipmentController < ApplicationController
  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.create(equipment_params)
    redirect_to root_path
  end

  private

  def equipment_params
    params.require(:equipment).permit(:title, :description)
  end
end
