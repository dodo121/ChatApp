@ConversationDetails = React.createClass
  handleCoversationSelect: ->
    console.log('called')
    @props.handleCoversationSelect @props.conversation.id

  render: ->
    React.DOM.li
      className: "#{@props.cssClassName} conversation-details"
      onClick: @handleCoversationSelect
      React.DOM.div className: 'row',
        React.DOM.div
          className: 'col-xs-8 conversation_users_names'
          @props.conversation.users_names
        React.DOM.div
          className: ('badge col-xs-2' if @props.conversation.newMessagesCount != 0)
          "#{@props.conversation.newMessagesCount}"
