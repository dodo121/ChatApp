# import React from 'react'
# import ReactDOM from 'react-dom'
# import PropTypes from 'prop-types'



#@ConversationsList = React.createClass
#  getInitialState: ->
#    conversations: @props.conversations
#
#  handleCoversationChange: (conversation_id) ->
#    @props.handleCoversationChange conversation_id
#
#  render: ->
#    React.DOM.ul className: 'conversations-list'
#    React.DOM.ul className: 'conversations-list',
#      for conversation in @state.conversations
#        React.createElement ConversationDetails,
#          key: conversation.id
#          conversation: conversation
#          handleCoversationSelect: @handleCoversationChange
#          cssClassName: if @props.currentConversationId == conversation.id then 'active' else ''
#          newMessagesCount: conversation.newMessagesCount
