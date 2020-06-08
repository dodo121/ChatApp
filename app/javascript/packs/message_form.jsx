import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

export default class MessageForm extends Component {
  constructor(props) {
    super(props);

    this.state = {
      content: '',
      submitable: false
    }
  }

  handleChange = (e) => {
    console.log('handle change called');
    const content = e.target.value;
    this.setState({ content: content });
    this.setState( { submitable: content != '' })
  };

  handleSubmit = (e) => {
    e.preventDefault();
    $.post(
      `conversations/${this.props.currentConversationId}/messages`,
      { message: this.state },
      (data) => {
        App.conversation.send(data);
        this.setState({ content : '' })
      }
      ,'JSON'
    );
  };

  render() {
    return (
      <div className='form-group'>
        <textarea
          className='form-control'
          name='content'
          onChange={this.handleChange}
          rows='3'
          placeholder='Type your message here'
          value={this.state.content}
          required={true}>
        </textarea>
        <button
          className='btn btn-primary'
          disabled={!this.state.submitable}
          onClick={this.handleSubmit}>
          {'Send'}
        </button>
      </div>
    )
  }
}
