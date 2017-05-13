class MessagesController < ApplicationController
  before_action :set_group, only: [:index, :create]

  def index
    @groups = current_user.groups.includes(:users)
    @message = Message.new
    @messages = Message.where(group_id: params[:group_id]).limit(4).order('created_at DESC').includes(:user)
  end

  def new; end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(@group), notice: "メッセージが作成されました"}
        format.json { render json: @message }
      end
    else
      flash.now[:alert]="メッセージの作成に失敗しました"
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

end
