import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import ConversationsListItem from './conversations_list_item'

const ConversationsList = ({ conversations }) =>
  <ul className='conversations-list'>
    {conversations}
  </ul>;

export default ConversationsList;
//export default class ConversationsList extends Component {
//  constructor(props) {
//    super(props);
//  }
//
//  handleConversationChange = (conversation_id) => {
//    console.log('change in list');
//    this.props.handleConversationChange(conversation_id)
//  };

    //return(
    //
    //)
  //}
//}

//#@ConversationsList = React.createClass
//#  render: ->
//#    React.DOM.ul className: 'conversations-list'
//#    React.DOM.ul className: 'conversations-list',
//#      for conversation in @state.conversations
//    #        React.createElement ConversationDetails,
//#          key: conversation.id
//#          conversation: conversation
//#          handleCoversationSelect: @handleCoversationChange
//    #          cssClassName: if @props.currentConversationId == conversation.id then 'active' else ''
//#          newMessagesCount: conversation.newMessagesCount
