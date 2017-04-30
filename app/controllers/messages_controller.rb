class MessagesController < ApplicationController
  before_action :group_params, only: [:index, :create]

  def index
    @groups = current_user.groups
    @message = Message.new
  end

  def new; end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path(@group), notice: "メッセージが作成されました"
    else
      flash[:alert]="メッセージの作成に失敗しました"
      render :new
    end
  end

  private
  def message_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
  end
  def group_params
    @group = Group.find(params[:group_id])
  end

end
