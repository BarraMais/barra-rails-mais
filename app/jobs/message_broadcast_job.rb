class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    sender = message.user
    recipient = message.conversation.opposed_user(sender)

    broadcast_to sender, message
    broadcast_to recipient, message
  end

  private

  def broadcast_to(user, message)
    ActionCable.server.broadcast(
      "conversations-#{user.id}",
      message_element: render_message_element(message, user),
      message: render_message(message),
      conversation_id: message.conversation_id
    )
  end

  def render_message_element(message, user)
    ApplicationController.render(
      partial: 'messages/message.html',
      locals: { message: message, user: user }
    )
  end

  def render_message(message)
    ApplicationController.render(
      partial: 'messages/message.json',
      locals: { message: message }
    )
  end
end
