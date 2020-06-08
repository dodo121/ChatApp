import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import ConversationsList from './conversations_list';
import ConversationsListItem from './conversations_list_item';
import Message from './message'
import Conversation from './conversation'

class Messenger extends Component {
  constructor(props) {
    super(props);
    this.state = {
      messages: props.initialMessages,
      currentConversationId: props.initialConversationId,
      currentUserId: props.current_user_id
    };
    this.setupAC();
  }

  setupAC = () => {
    this.props.conversations.forEach((conv) => {
      App.conversation =
        App.cable.subscriptions.create(
          { channel: "ConversationChannel", id: conv.id },
          {
            received: (data) =>{
              this.addMessage(data);
            }
          }
        )
      //connected: ->
      //disconnected: ->
    });
  };

  addMessage = (message) => {
    if(message.conversation_id == this.state.currentConversationId) {
      this.setState({ messages: [...this.state.messages, message] });
    } else {
      //conversationWithUnreadMessages = this.state.conversations.find (conversation) => {
      //  message.conversation_id = conversation.id
      //}
    }
  };

  componentDidUpdate = () => {
    //console.log($('.conversation-messages').position());
    $('.conversation-messages').animate({
      scrollTop: $('#conversation-bottom-position').position().top
    }, 'fast');
  };
    //index = @state.conversations.indexOf(conversationWithUnreadMessages)
    //conversationWithUnreadMessages.newMessagesCount = conversationWithUnreadMessages.newMessagesCount + 1
    //conversations = @state.conversations
    //conversations[index] = conversationWithUnreadMessages
    //@setState conversations: conversations
    //@toggleSeen(message)
  //
  changeConversation = (conversation_id) => {
    console.log(conversation_id);
    $.get(
      `conversations/${conversation_id}`,
      (data) => {
        this.setState({
          messages: data,
          currentConversationId: conversation_id
        })
      },
      'json'
    )
  };

  render() {
    let conversationsEls = this.props.conversations.map(conv => {
      return <ConversationsListItem
        key={conv.id}
        conversation={conv}
        cssClassName={(this.state.currentConversationId == conv.id) ? 'active' : ''}
        handleConversationChange={() => this.changeConversation(conv.id) }/>
    });

    let messagesEls = this.state.messages.map(message => {
      return <Message
        key={message.id}
        message={message}
        mine={this.props.current_user_id == message.message_sender_id}
        current_user_id={this.props.current_user_id} />
    });

    return(
      <div className='row'>
        <div className='col-sm-3 col-xs-12'>
          <ConversationsList
            conversations={conversationsEls}
            currentConversationId={this.state.currentConversationId}/>
        </div>

        <div className='col-sm-9 col-xs-12'>
          <Conversation
            messages={messagesEls}
            currentConversationId={this.state.currentConversationId}/>
        </div>
      </div>
    )
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const node = document.getElementById('conversation')
  const data = JSON.parse(node.getAttribute('data'))

  ReactDOM.render(<Messenger {...data} />, node)
})
//#
//#  toggleSeen: (message) ->
//#    $.ajax
//#      method: "PATCH",
//#      url: "conversations/#{message.conversation_id}/messages/#{message.id}/toggle_seen"
//#

