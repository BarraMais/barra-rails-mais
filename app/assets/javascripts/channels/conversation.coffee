App.conversation = App.cable.subscriptions.create "ConversationChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    conversation = $('#conversations-list [data-conversation-id="'+data['conversation_id']+'"]');
    conversation.find('.messages-list ul').append(data['message_element']);
    messages_list = conversation.find '.messages-list';
    height = messages_list[0].scrollHeight;
    messages_list.scrollTop(height);
    # Called when there's incoming data on the websocket for this channel

  speak: (message) ->
    @perform('speak', message: message);



$(document).on 'submit', '.new_message', (e) ->
  e.preventDefault();
  values = $(this).serializeArray();
  App.conversation.speak(values);
  $(this).trigger('reset');
