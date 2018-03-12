class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.user_id = current_user.id
    if message.save
      ActionCable.server.broadcast message.chatroom.slug,
        message: message.content,
        username: message.user.username
      head :ok
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end
end