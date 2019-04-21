import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import ConversationsList from './conversations_list';
import ConversationsListItem from './conversations_list_item';
import Message from './message'

class Messenger extends Component {
  constructor(props) {
    super(props);
    this.state = {
      messages: props.initialMessages,
      currentConversationId: props.initialConversationId,
      currentUserId: props.current_user_id
    }
  }

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

        <div className='col-sm-9 col-xs-12 conversation-messages'>
          {messagesEls}
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

// React.DOM.div className: 'row',
//#      React.DOM.div className: 'col-sm-3 col-xs-12',
//#        React.createElement ConversationsList,
//#          conversations: @state.conversations
//    #          handleCoversationChange: @changeConversation
//    #          currentConversationId: @state.currentConversationId
//    #      React.DOM.div className: 'col-sm-9 col-xs-12 conversation-messages',
//#        for message in @state.messages
//    #          React.createElement Message, key: message.id, message: message, current_user_id: @props.current_user_id
//#        React.createElement MessageForm, currentConversationId: @state.currentConversationId

            //React.createElement ConversationsList,
            //conversations: @state.conversations
        //handleCoversationChange: @changeConversation
        //currentConversationId: @state.currentConversationId
        //React.DOM.div className: 'col-sm-9 col-xs-12 conversation-messages',
        //for message in @state.messages
        //    React.createElement
        //React.createElement MessageForm, currentConversationId: @state.currentConversationId
        //)
    //}
//}


//#@Conversation = React.createClass
//#  getInitialState: ->
//#    messages: @props.initialMessages
//    #    currentConversationId: @props.initialConversationId
//    #    conversations: @props.conversations
//    #    currentUserId: @props.current_user_id
//    #
//#  componentDidMount: ->
//#    @setupAC()
//#
//#  setupAC: ->
//#    for conversation in @props.conversations
//    #      do =>
//#        App.conversation = App.cable.subscriptions.create { channel: "ConversationChannel", id: conversation.id },
//#          connected: ->
//#          disconnected: ->
//#          received: (data) =>
//#            this.addMessage(data)
//#
//#  addMessage: (message) ->
//#    if message.conversation_id == @state.currentConversationId
//    #      messages = React.addons.update(@state.messages, { $push: [message] })
//#      @setState messages: messages
//#    else
//#      conversationWithUnreadMessages = @state.conversations.find (conversation) =>
//#        message.conversation_id = conversation.id
//#
//#      index = @state.conversations.indexOf(conversationWithUnreadMessages)
//#      conversationWithUnreadMessages.newMessagesCount = conversationWithUnreadMessages.newMessagesCount + 1
//#      conversations = @state.conversations
//#      conversations[index] = conversationWithUnreadMessages
//#      @setState conversations: conversations
//#      @toggleSeen(message)
//#
//#  toggleSeen: (message) ->
//#    $.ajax
//#      method: "PATCH",
//#      url: "conversations/#{message.conversation_id}/messages/#{message.id}/toggle_seen"
//#

//#
//#  render: ->
//#
