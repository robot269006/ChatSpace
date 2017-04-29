class MessagesController < ApplicationController
  before_action :group_params, only: [:index, :create]

  def index
    @user = User.find(current_user.id)
    @group = Group.includes(:user)
  end

  def create
    @message = Messages.new(create_params)
  end

  private
  def create_params
    params.require(:messages).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
  end
  def group_params
    @group = Group.find(params[:groups_id])
  end

end
