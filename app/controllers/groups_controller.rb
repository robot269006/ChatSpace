class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(create_params)
    if @group.save
      flash[:notice]="チャットグループが作成されました"
      redirect_to controller: :top, action: :index
    else
      flash[:alert]="チャットグループの作成に失敗しました"
      redirect_to controller: :groups, action: :new
    end
  end

  private
  def create_params
    params.require(:group).permit(:name)
  end

end
