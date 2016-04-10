@MessageInput = React.createClass
  handleChange: (e) ->
    name = e.target.name
    @setState "#{name}": e.target.value

  handleSubmit: (e) ->
    e.preventDefault()

  render: ->
    React.DOM.form onSubmit: @handleSubmit,
      React.DOM.input
        type: 'text'
        name: 'message-input'
        onChange: @handleChange
      React.DOM.button
        type: 'submit'
        'Send'