class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.create(create_params)
  end

  private
  def create_params
    params.require(:group).permit(:name)
  end

end
