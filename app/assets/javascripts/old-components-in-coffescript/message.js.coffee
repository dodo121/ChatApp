#@Message = React.createClass
#  render: ->
#    panelType = if @props.message.message_sender_id == @props.current_user_id
#                  'primary text-right'
#                else
#                  'info text-left'
#
#    colAlignCss = if @props.message.message_sender_id == @props.current_user_id
#                    ['col-xs-10', 'col-xs-offset-2']
#                  else
#                    ['col-xs-offset-2', 'col-xs-10']
#
#    React.DOM.div className: 'row',
#      React.DOM.div className: colAlignCss[0]
#      React.DOM.div className: colAlignCss[1],
#        React.DOM.div className: "message panel panel-#{panelType}",
#          React.DOM.div className: "panel panel-heading", @props.message.user_name
#          React.DOM.div className: "panel panel-body", @props.message.content
