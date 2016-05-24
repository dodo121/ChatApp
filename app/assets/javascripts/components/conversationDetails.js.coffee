@ConversationDetails = React.createClass
  handleCoversationSelect: ->
    @props.handleCoversationSelect @props.conversation.conversation_id

  render: ->
    React.DOM.li onClick: @handleCoversationSelect, className: @props.cssClassName, @props.conversation.users_names

