class MessagesController < ApplicationController
before_action :set_group

def index
  @messages = @group.messages
  @message = Message.new
end

def create
  @message = @group.messages.new(message_params)
  if @message.save
    respond_to do |format|
      format.html{redirect_to group_messages_path(@group)}
      format.json
    end
  else
    flash.now[:alert] = 'error'
  end
end


private

def set_group
  @group = Group.find(params[:group_id])
end

def message_params
  params.require(:message).permit(:content).merge(user_id: current_user.id)
end

end
