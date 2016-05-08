@MessageForm = React.createClass
  getInitialState: ->
    content: ''

  handleChange: (e) ->
    name = e.target.name
    @setState "#{name}": e.target.value

  handleSubmit: (e) ->
    e.preventDefault()
    $.post "#{@props.conversation_id}/messages", message: @state, (data) =>
      @props.handleNewMessage data
      @setState @getInitialState()
    , 'JSON'

  render: ->
    React.DOM.form onSubmit: @handleSubmit,
      React.DOM.div className: 'form-group',
        React.DOM.textarea
          className: 'form-control'
          name: 'content'
          onChange: @handleChange
          rows: 3
        React.DOM.button
          className: 'btn btn-primary'
          type: 'submit'
          'Send'