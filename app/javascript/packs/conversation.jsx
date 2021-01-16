import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import MessageForm from './message_form'
import TrackVisibility from "react-on-screen";
import Message from "./message";

export default class Conversation extends Component {
  constructor(props) {
    super(props);
    this.state = {
      messages: props.messages
    }
  }

  componentDidMount = () => {
    $('.conversation-messages').animate({
      scrollTop: $('#conversation-bottom-position').position().top
    }, 'fast');
  };

  handleSeen = (message_id) => {
    $.ajax({
      method: "PATCH",
      url: `conversations/${this.props.currentConversationId}/messages/${message_id}/toggle_seen`
    }).done(() => {
      alert('toggled');
    })
  }

  render() {
    let messagesEls = this.state.messages.map(message => {
      return <TrackVisibility key={message.id} once>
        <Message
          message={message}
          mine={this.props.current_user_id == message.message_sender_id}
          current_user_id={this.props.current_user_id}
          handleSeen={() => this.handleSeen(message.id)}/>
      </TrackVisibility>
    });

    return(
      <div>
        <div className='conversation-messages'>
          {messagesEls}
          <div id='conversation-bottom-position'></div>
        </div>
        <MessageForm currentConversationId={this.props.currentConversationId}/>
      </div>
    )
  }
}
