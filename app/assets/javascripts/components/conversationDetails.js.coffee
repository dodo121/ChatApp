@ConversationDetails = React.createClass
  handleCoversationSelect: ->
    @props.handleCoversationSelect @props.conversation.id

  render: ->
    React.DOM.li
      className: "#{@props.cssClassName} conversation-details"
      onClick: @handleCoversationSelect
      React.DOM.span null, @props.conversation.users_names
        React.DOM.span
          className: 'badge' if @props.conversation.newMessagesCount != 0
          " #{@props.conversation.newMessagesCount}"

