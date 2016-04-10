@Room = React.createClass
  getIntialState: ->
    messages: @props.messages

  render: ->
    React.DOM.div null,
      for message in @props.messages
        React.createElement Message, key: message.id, message: message
      React.createElement MessageInput, null