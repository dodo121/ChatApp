@ConversationDetails = React.createClass
  render: ->
    React.DOM.li null, @props.conversation.users_names
