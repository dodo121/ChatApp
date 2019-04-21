//#@Message = React.createClass
//#  render: ->
//#    panelType = if @props.message.message_sender_id == @props.current_user_id
//  #                  'primary text-right'
//#                else
//#                  'info text-left'
//#
//#    colAlignCss = if @props.message.message_sender_id == @props.current_user_id
//  #                    ['col-xs-10', 'col-xs-offset-2']
//#                  else
//#                    ['col-xs-offset-2', 'col-xs-10']
//#
//#    React.DOM.div className: 'row',
//#      React.DOM.div className: colAlignCss[0]
//#      React.DOM.div className: colAlignCss[1]

import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

const Message = (props) =>
  <div className='row'>
    <div className={`message panel panel-primary text-${(props.mine) ? 'right col-xs-offset-2' : 'left  '}`}>
      <div className="panel panel-heading">
        {(props.mine) ? 'You' : props.message.user_name}
      </div>
      <div className="panel panel-body">{props.message.content}</div>
    </div>
  </div>;

export default Message;
