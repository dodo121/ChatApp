import React from 'react'

const Message = (props) =>
  <div className={`message panel panel-primary text-${(props.mine) ? 'right col-xs-offset-2' : 'left '}`}>
    <div className="panel panel-heading">
      {(props.mine) ? 'You' : props.message.user_name}
    </div>
    <div className="panel panel-body">{props.message.content}</div>
  </div>;

export default Message;
