@Message = React.createClass
  current_message: (sender_id, current_user_id) ->
    sender_id == current_user_id

  makeMessageSeen: (message) ->
    $.ajax
      method: "PATCH",
      url: "conversations/#{message.conversation_id}/messages/#{message.id}/make_seen"

  render: ->
    panelType = if current_message(@props.message.message_sender_id, @props.current_user_id)
                  'primary text-right'
                else
                  'info text-left'

    colAlignCss = if current_message(@props.message.message_sender_id, @props.current_user_id)
                    ['col-xs-10', 'col-xs-offset-2']
                  else
                    ['col-xs-offset-2', 'col-xs-10']

    React.DOM.div className: 'row',
      React.DOM.div className: colAlignCss[0]
      React.DOM.div className: colAlignCss[1],
        React.DOM.div className: "message panel panel-#{panelType}",
          React.DOM.div className: "panel panel-heading", @props.message.user_name
          React.DOM.div className: "panel panel-body", @props.message.content