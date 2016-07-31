@ConversationDetails = React.createClass
  handleCoversationSelect: ->
    @props.handleCoversationSelect @props.conversation.id

  render: ->
    React.DOM.li
      className: @props.cssClassName
      onClick: @handleCoversationSelect
      React.DOM.span null, @props.conversation.users_names
        React.DOM.span null, " #{@props.conversation.newMessagesCount}"

