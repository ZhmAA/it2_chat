jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')
  if $('#messages').length > 0

    App.privat_chat = App.cable.subscriptions.create {
        channel: "ChatsChannel"
        chat_id: messages.data('chat-id')
      },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        messages.append data['message']

      send_message: (message, chat_id) ->
        @perform 'send_message', message: message, chat_id: chat_id

    $('#new_message').submit (e) ->
      $this = $(this)
      textarea = $this.find('#message_field')
      if $.trim(textarea.val()).length > 1
        App.privat_chat.send_message textarea.val(), messages.data('chat-id')
        textarea.val('')
      e.preventDefault()
      return false