import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import MessageForm from './message_form'

export default class Conversation extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    return(
      <div>
        <div className='conversation-messages'>
          {this.props.messages}
          <div id='conversation-bottom-position'></div>
        </div>
        <MessageForm currentConversationId={this.props.currentConversationId}/>
      </div>
    )
  }
}
