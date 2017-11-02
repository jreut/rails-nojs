chatId = Number(window.location.pathname.split('/')[2])

App.chat = App.cable.subscriptions.create { channel: "ChatChannel", id: chatId },
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    window.location.reload()
