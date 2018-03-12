class MessagesChannel < ApplicationCable::Channel
  def subscribed(channel_slug='rails-chat')
    stream_from channel_slug
  end
end 