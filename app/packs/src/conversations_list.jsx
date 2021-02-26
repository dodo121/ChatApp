import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import ConversationsListItem from './conversations_list_item'

const ConversationsList = ({ conversations }) =>
  <ul className='conversations-list'>
    {conversations}
  </ul>;

export default ConversationsList;
