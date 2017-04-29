class MessagesController < ApplicationController
  before_action :group_params, only: [:index, :create]

  def index
    @user = User.find(current_user.id)
    @group = Group.includes(:user)
  end

  def new; end

  def create
    @message = Messages.new(create_params)
    if @message.save
      redirect_to root_path, notice: "メッセージが作成されました"
    else
      flash [:alert]="メッセージの作成に失敗しました"
      render :new
  end

  private
  def create_params
    params.require(:messages).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
  end
  def group_params
    @group = Group.find(params[:group_id])
  end

end
