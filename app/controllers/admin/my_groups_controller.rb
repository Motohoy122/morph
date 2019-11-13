class Admin::MyGroupsController < ApplicationController
  def new
    @mygroup = MyGroup.new
  end

  def create
    @mygroup = MyGroup.create(mygroup_params)
    redirect_to root_path
  end

  private

  def mygroup_params
    params.require(:my_group).permit(:title, :description)
  end
end
