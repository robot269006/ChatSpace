class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(create_params)
    if @group.save
      redirect_to root_path, notice: "チャットグループが作成されました"
    else
      flash[:alert]="チャットグループの作成に失敗しました"
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update
      redirect_to root_path, notice: "チャットグループを編集しました"
    else
      flash[:alert]="チャットグループの編集に失敗しました"
      render :edit
    end
  end

  private
  def create_params
    params.require(:group).permit(:name)
  end

end
