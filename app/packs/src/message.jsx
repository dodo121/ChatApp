import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

const Message = (props) =>
  <div className={`message panel panel-primary text-${(props.mine) ? 'right col-xs-offset-2' : 'left '}`}>
    <div className="panel panel-heading">
      {(props.mine) ? 'You' : props.message.user_name}
    </div>
    <div className="panel panel-body">{props.message.content}</div>
  </div>;

export default Message;
