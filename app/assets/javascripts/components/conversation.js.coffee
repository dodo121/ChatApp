@Conversation = React.createClass
  getInitialState: ->
    messages: @props.initialMessages
    currentConversationId: @props.initialConversationId
    conversations: @props.conversations
    currentUserId: @props.current_user_id

  componentDidMount: ->
    @setupAC()

  setupAC: ->
    for conversation in @props.conversations
      do =>
        App.conversation = App.cable.subscriptions.create { channel: "ConversationChannel", id: conversation.id },
          connected: ->
          disconnected: ->
          received: (data) =>
            this.addMessage(data)

  addMessage: (message) ->
    if message.conversation_id == @state.currentConversationId
      messages = React.addons.update(@state.messages, { $push: [message] })
      @setState messages: messages
    else
      conversationWithUnreadMessages = @state.conversations.find (conversation) =>
        message.conversation_id = conversation.id

      index = @state.conversations.indexOf(conversationWithUnreadMessages)
      conversationWithUnreadMessages.newMessagesCount = conversationWithUnreadMessages.newMessagesCount + 1
      conversations = @state.conversations
      conversations[index] = conversationWithUnreadMessages
      @setState conversations: conversations
      @toggleSeen(message)

  toggleSeen: (message) ->
    $.ajax
      method: "PATCH",
      url: "conversations/#{message.conversation_id}/messages/#{message.id}/toggle_seen"

  changeConversation: (conversation_id) ->
    $.get "conversations/#{conversation_id}", (data) =>
      @setState messages: data, currentConversationId: conversation_id
    , 'JSON'

  render: ->
    React.DOM.div className: 'row',
      React.DOM.div className: 'col-sm-3 col-xs-12',
        React.createElement ConversationsList,
          conversations: @state.conversations
          handleCoversationChange: @changeConversation
          currentConversationId: @state.currentConversationId
      React.DOM.div className: 'col-sm-9 col-xs-12 conversation-messages',
        for message in @state.messages
          React.createElement Message, key: message.id, message: message, current_user_id: @props.current_user_id
        React.createElement MessageForm, currentConversationId: @state.currentConversationId
