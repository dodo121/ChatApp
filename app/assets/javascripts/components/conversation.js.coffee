@Conversation = React.createClass
  getInitialState: ->
    messages: @props.messages
    conversationId: @props.conversation_id

  addMessage: (message) ->
    messages = React.addons.update(@state.messages, { $push: [message] })
    @setState messages: messages

  changeConversation: (conversation_id) ->
    $.get "conversations/#{conversation_id}", (data) =>
      @setState messages: data
    , 'JSON'
    @setState conversationId: conversation_id

  render: ->
    React.DOM.div className: 'row',
      React.DOM.div className: 'col-sm-3',
        React.createElement ConversationsList, conversations: @props.conversations, handleCoversationChange: @changeConversation
      React.DOM.div className: 'col-sm-9',
        for message in @state.messages
          React.createElement Message, key: message.id, message: message
        React.createElement MessageForm, handleNewMessage: @addMessage, conversationId: @state.conversationId
