class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.create(create_params)
    redirect_to controller: :top, action: :index
  end

  private
  def create_params
    params.require(:group).permit(:name)
  end

end
