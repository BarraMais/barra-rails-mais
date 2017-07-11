class ConversationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "conversations-#{current_user.id}"
  end

  def unsubscribed
    stop_all_streams
  end

  def speak(data)
    message_params = data['message'].each_with_object({}) do |elem, param|
      param[elem.values.first] = elem.values.last
    end

    current_user.messages.create(message_params)
    # Message.create message_params
  end
end
