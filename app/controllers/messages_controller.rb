class MessagesController < ApplicationController
  before_action :set_group, only: [:index, :create]

  def index
    @groups = current_user.groups.includes(:users)
    @message = Message.new
    @messages = @group.messages.order('created_at ASC').includes(:user)
  end

  def new; end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(@group), notice: "メッセージが作成されました"}
        format.json { render 'messages', handlers: 'jbuilder' }
      end
    else
      flash.now[:alert]="メッセージの作成に失敗しました"
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

end
