class GroupsController < ApplicationController
  before_action :set_params, only: [:edit, :update]

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

  def edit; end

  def update
    if @group.update(create_params)
      redirect_to root_path, notice: "チャットグループを編集しました"
    else
      flash[:alert]="チャットグループの編集に失敗しました"
      render :edit
    end
  end

  private

  def create_params
    params.require(:group).permit(:name, {user_ids: []})
  end
  def set_params
    @group = Group.find(params[:id])
  end
end
