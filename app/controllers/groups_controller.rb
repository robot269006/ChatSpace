class GroupsController < ApplicationController

  def new
  end

  def edit
  end

  def create
    Groups.create(group_params)
  end

  private
  def group_params
    params.require(:group).permit(:name, :body)
  end

end
