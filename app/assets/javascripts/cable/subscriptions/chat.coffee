App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    # Called once the subscription has been successfully completed

  join: (channelId) ->
    @perform 'join', channel_id: channelId
    @channelId = channelId

  leave: ->
    @perform 'leave', channel_id: @channelId

  write: (text) ->
    @perform 'write', channel_id: @channelId, text: text

  received: (data) ->
    if(data.type == "wrote")
      $("#chat-content").append("<tr><td></td><td>#{data.data.text}</td></tr>");
