@Message = React.createClass
  render: ->
    console.log @props.message
    panelType = if @props.message.id % 2 == 0 then 'primary text-right' else 'info text-left'
    React.DOM.div className: "panel panel-#{panelType}",
      React.DOM.div className: "panel panel-heading", @props.message.user_name
      React.DOM.div className: "panel panel-body", @props.message.content