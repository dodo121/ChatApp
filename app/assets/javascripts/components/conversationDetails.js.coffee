@ConversationDetails = React.createClass
  handleCoversationSelect: ->
    @props.handleCoversationSelect @props.conversation.id

  render: ->
    React.DOM.li
      className: "#{@props.cssClassName} conversation-details"
      onClick: @handleCoversationSelect
      React.DOM.div
        React.DOM.div @props.conversation.users_names, className: 'col-xs-11'
        React.DOM.div null, className: 'badge col-xs-1' if @props.conversation.newMessagesCount != 0, "#{@props.conversation.newMessagesCount}"
