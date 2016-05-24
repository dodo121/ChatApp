@Conversation = React.createClass
  getInitialState: ->
    messages: @props.initialMessages
    currentConversationId: @props.initialConversationId

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
      alert 'New message'

  changeConversation: (conversation_id) ->
    $.get "conversations/#{conversation_id}", (data) =>
      @setState messages: data, currentConversationId: conversation_id
    , 'JSON'

  render: ->
    React.DOM.div className: 'row',
      React.DOM.h1 null, @state.currentConversationId
      React.DOM.div className: 'col-sm-3',
        React.createElement ConversationsList,
          conversations: @props.conversations
          handleCoversationChange: @changeConversation
          currentConversationId: @state.currentConversationId
      React.DOM.div className: 'col-sm-9',
        for message in @state.messages
          React.createElement Message, key: message.id, message: message
        React.createElement MessageForm, currentConversationId: @state.currentConversationId
