@Conversation = React.createClass
  getInitialState: ->
    messages: @props.messages

  addMessage: (message) ->
    messages = React.addons.update(@state.messages, { $push: [message] })
    @setState messages: messages

  render: ->
    React.DOM.div
      id: 'conversation',
        for message in @state.messages
          React.createElement Message, key: message.id, message: message
      React.createElement MessageForm, handleNewMessage: @addMessage, conversation_id: @props.conversation_id
#      $("#conversation").scrollTop(500)