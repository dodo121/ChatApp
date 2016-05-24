@MessageForm = React.createClass
  getInitialState: ->
    content: ''

  handleChange: (e) ->
    name = e.target.name
    @setState "#{name}": e.target.value

  handleSubmit: (e) ->
    e.preventDefault()
    $.post "conversations/#{@props.currentConversationId}/messages", message: @state, (data) =>
      App.conversation.send(data)
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
          placeholder: 'Type your message here'
          value: @state.content
        React.DOM.button
          className: 'btn btn-primary'
          type: 'submit'
          'Send'