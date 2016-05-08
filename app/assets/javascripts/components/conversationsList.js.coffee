@ConversationsList = React.createClass
  getInitialState: ->
    conversations: @props.conversations

  render: ->
    React.DOM.ul null,
      for conversation in @state.conversations
        React.createElement ConversationDetails, key: conversation.id, conversation: conversation
        #React.DOM.div null, 'test'