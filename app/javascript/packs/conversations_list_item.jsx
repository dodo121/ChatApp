import React, { Component } from 'react'

export default class ConversationsListItem extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    const newMessages = (<div className={'badge col-xs-2'}>
      {this.props.conversation.newMessagesCount}
    </div>);

    return(
      <li
        className={`${this.props.cssClassName} conversation-details`}
        onClick={this.props.handleConversationChange}>
        <div className='row'>
          <div className='col-xs-8 conversation_users_names'>
            {this.props.conversation.users_names}
          </div>
          {this.props.conversation.newMessagesCount != 0 && newMessages}
        </div>
      </li>
    )
  }
}
