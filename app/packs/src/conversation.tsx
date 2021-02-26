import React, { FC } from 'react';
import MessageForm from './message_form';

interface Props {
    messages: any,
    currentConversationId: any
}

const Conversation: FC<Props> = ({ messages, currentConversationId }) => {
  return (
    <div>
      <div className={'conversation-messages'}>
        {messages}
        <div id='conversation-bottom-position'/>
      </div>
      <MessageForm currentConversationId={currentConversationId}/>
    </div>
  )
}

export default Conversation
