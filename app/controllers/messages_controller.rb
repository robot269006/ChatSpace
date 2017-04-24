class MessagesController < ApplicationController

def index
end

def create
  @message = Messages.new(create_params)
end

private
def create_params
  message.require(messages).permit(:body, :user_id, :group_id)
end

end
