# jQuery(document).on 'turbolinks:load', ->
$(document).ready ->
  messages_to_bottom = ->
    $('.msg_history').scrollTop($('.msg_history').prop("scrollHeight"))

  messages = $('#conversation-body')

  if $('#current-user').length > 0
    App.personal_chat = App.cable.subscriptions.create {
      channel: "NotificationsChannel"
    },
    send_message: (message, conversation_id) ->
      @perform 'send_message', message: message, conversation_id: conversation_id

    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      # Called when data is received
      messages = $('#conversation-body')
      if messages.length > 0 && messages.data('conversation-id') is data['conversation_id']
        messages.append data['message']
        messages_to_bottom()
      else
        # $.getScript('/conversations') if $('#conversations').length > 0
        $('body').append(data['notification']) if data['notification']

  $(document).on 'click', '#notification .close', ->
    $(this).parents('#notification').fadeOut(1000)

  if messages.length > 0
     messages_to_bottom()
     $('#new_personal_message').submit (e) ->
       $this = $(this)
       textarea = $this.find('#personal_message_body')
       if $.trim(textarea.val()).length > 1
         App.personal_chat.send_message textarea.val(), $this.find('#conversation_id').val()
         textarea.val('')
       e.preventDefault()
       return false
