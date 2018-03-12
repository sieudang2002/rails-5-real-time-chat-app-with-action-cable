class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
  end

  def init_chatroom
    chatroom_id = params["chatroom"]
    topic = params["topic"]
    username = params["username"]

    if chatroom_id.blank? && topic.blank?
      redirect_to action: :index, alert: "Please select chatroom or type your topic" and return
    end

    user = User.find_or_create_by(username: username)
    if user.errors.any?
      redirect_to action: :index, alert: user.errors.full_messages and return
    end

    if topic.present? 
      chatroom = Chatroom.find_or_create_by(topic: topic)
    else
      chatroom = Chatroom.find(chatroom_id)
    end
    session[:user_id] = user.id
    redirect_to chatroom_path(chatroom.slug)
  end

  def show
    @chatroom = Chatroom.find_by(slug: params[:slug])
    if @chatroom.blank?
      redirect_to action: :index and return
    end
    @message = Message.new
  end
end