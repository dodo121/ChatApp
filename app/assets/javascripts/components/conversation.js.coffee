@Conversation = React.createClass
  getInitialState: ->
    messages: @props.messages
    conversationId: @props.conversation_id

  componentWillUpdate: ->
    @setupAC()
    @scrollToBottomOfMessagesBox()

  componentDidMount: ->
    @setupAC()
    @scrollToBottomOfMessagesBox()

  scrollToBottomOfMessagesBox: ->
    height = jQuery('.messages-box')[0].scrollHeight
    jQuery('.messages-box').scrollTop(height)

  setupAC: ->
    if App.cable.subscriptions['subscriptions'].length > 1
      App.cable.subscriptions.remove(App.cable.subscriptions['subscriptions'][1])

    App.conversation = App.cable.subscriptions.create { channel: "ConversationChannel", conversation_id: @state.conversationId },
      connected: ->
      disconnected: ->
      # Called when the subscription has been terminated by the server

      received: (data) =>
        this.addMessage(data)

  addMessage: (message) ->
    messages = React.addons.update(@state.messages, { $push: [message] })
    @setState messages: messages

  changeConversation: (conversation_id) ->
    $.get "conversations/#{conversation_id}", (data) =>
      @setState messages: data, conversationId: conversation_id
    , 'JSON'

  render: ->
    React.DOM.div className: 'row',
      React.DOM.h1 null, @state.conversationId
      React.DOM.div className: 'col-sm-3',
        React.createElement ConversationsList, conversations: @props.conversations, handleCoversationChange: @changeConversation
        React.createElement UserStatus, statuses: @props.available_user_statuses
      React.DOM.div className: 'col-sm-9 messages-box',
        for message in @state.messages
          React.createElement Message, key: message.id, message: message
        React.createElement MessageForm, conversationId: @state.conversationId
