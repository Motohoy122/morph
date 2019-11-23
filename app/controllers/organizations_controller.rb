class OrganizationsController < ApplicationController
  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.create(organization_params)
    redirect_to root_path
  end

  def show
    @organization = Organization.find(params[:id])
  end

  private

  def organization_params
    params.require(:organization).permit(:company_name, :company_address, :city, :state, :zip_code, :email)
  end
end
