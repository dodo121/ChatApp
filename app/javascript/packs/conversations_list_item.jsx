import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

export default class ConversationsListItem extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    return(
      <li
        className="{this.props.cssClassName} conversation-details"
        onClick={this.props.handleConversationChange}>
        <div className='row'>
          <div className='col-xs-8 conversation_users_names'>
            {this.props.conversation.users_names}
          </div>
          <div className={(this.props.conversation.newMessagesCount != 0 && 'badge col-xs-2')}>
            {this.props.conversation.newMessagesCount}
          </div>
        </div>
      </li>
    )
  }
}
// #@ConversationDetails = React.createClass
// #  handleCoversationSelect: ->
// #    console.log('called')
// #    @props.handleCoversationSelect @props.conversation.id
// #
// #  render: ->
// #    React.DOM.li
// #      className: "#{@props.cssClassName} conversation-details"
// #      onClick: @handleCoversationSelect
// #      React.DOM.div className: 'row',
// #        React.DOM.div
// #          className: 'col-xs-8 conversation_users_names'
// #          @props.conversation.users_names
// #        React.DOM.div
// #          className: ('badge col-xs-2' if @props.conversation.newMessagesCount != 0)
// #          "#{@props.conversation.newMessagesCount}"
