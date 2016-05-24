@ConversationsList = React.createClass
  getInitialState: ->
    conversations: @props.conversations

  handleCoversationChange: (conversation_id) ->
    @props.handleCoversationChange conversation_id

  render: ->
    React.DOM.ul className: 'conversations-list',
      for conversation in @state.conversations
        React.createElement ConversationDetails,
          key: conversation.conversation_id
          conversation: conversation
          handleCoversationSelect: @handleCoversationChange
          cssClassName: if @props.currentConversationId == conversation.conversation_id then 'active' else ''
