class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(create_params)
    if @group.save
      redirect_to root_path(@group), notice: "チャットグループが作成されました"
    else
      flash[:alert]="チャットグループの作成に失敗しました"
      render action: :new
    end
  end

  private
  def create_params
    params.require(:group).permit(:name)
  end

end
