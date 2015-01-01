###
# Chat Message Component
#
# @cjxs React.DOM
###

React = require('react')

ChatStore = require('../stores/ChatStore')

getChatMessages = ->
  {
    messages: ChatStore.getAll()
  }


ChatMessageComponent = React.createClass {
  displayName: 'ChatMessage'
  shouldScrollBottom: false

  getInitialState: ->
    getChatMessages()

  componentDidMount: ->
    ChatStore.addChangeListener(@_onChange)

    node = @getDOMNode()
    @shouldScrollBottom = node.scrollTop + node.offsetHeight is node.scrollHeight

    if @shouldScrollBottom
      node = @getDOMNode()
      node.scrollTop = node.scrollHeight

  componentWillUnmount: ->
    ChatStore.removeChangeListeher(@_onChange)

  componentWillUpdate: ->
    node = @getDOMNode()
    @shouldScrollBottom = node.scrollTop + node.offsetHeight is node.scrollHeight

  componentDidUpdate: ->
    if @shouldScrollBottom
      node = @getDOMNode()
      node.scrollTop = node.scrollHeight

  _onChange: ->
    @setState(getChatMessages())

  render: ->
    messages = []

    for message, key in @state.messages
      messages.push(<div key={key}><strong>{message.user.nickname}</strong>：{message.message}</div>)

    <div className="messages">
      {messages}
    </div>
}

module.exports = ChatMessageComponent
