App.room = App.cable.subscriptions.create { channel: "RoomChannel", room_id: 1 },
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    Room.addMessage(data)