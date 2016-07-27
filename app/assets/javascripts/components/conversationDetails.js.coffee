@ConversationDetails = React.createClass
  handleCoversationSelect: ->
    @props.handleCoversationSelect @props.conversation.id

  render: ->
    React.DOM.li className: @props.cssClassName,
      React.DOM.span
        onClick: @handleCoversationSelect
        @props.conversation.users_names
      React.DOM.span null, " #{@props.conversation.newMessagesCount}"

