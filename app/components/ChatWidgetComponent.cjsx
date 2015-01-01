###
# Chat Widget
#
# @cjsx React.DOM
###

React = require('react')

ChatMessage = require('./ChatMessageComponent.cjsx')
ChatInput = require('./ChatInputComponent.cjsx')

ChatWidgetComponent = React.createClass {
  displayName: 'ChatWidget'
  render: ->
    <div {...@props}>
      <ChatMessage />
      <ChatInput />
    </div>
}

module.exports = ChatWidgetComponent
