@ConversationDetails = React.createClass
  handleCoversationSelect: ->
    @props.handleCoversationSelect @props.conversation.id

  render: ->
    React.DOM.li onClick: @handleCoversationSelect, className: @props.cssClassName, @props.conversation.users_names

