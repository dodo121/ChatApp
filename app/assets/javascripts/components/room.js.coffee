@Room = React.createClass
  getInitialState: ->
    messages: @props.messages

  window.addMessage = (message) ->
    console.log 'in add message'
    messages = React.addons.update(@state.messages, { $push: [message] })
    @setState messages: messages

  render: ->
    React.DOM.div id: 'conversation',
      React.DOM.div id: 'messages',
        for message in @state.messages
          React.createElement Message, key: message.id, message: message
      React.createElement MessageForm, handleNewMessage: @addMessage, room_id: @props.room_id