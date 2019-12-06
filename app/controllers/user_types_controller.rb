class UserTypesController < ApplicationController
  def new
    @user_type = UserType.new
  end

  def create
    @user_type = UserType.create(user_type_params)
    redirect_to root_path
  end

  def show
    @user_type = Course.find(params[:id])
  end

  private

  def user_type_params
    params.require(:user_type).permit( :user_type_name)
  end
end
