###
# Chat Controller
###

User = require('../model/User')
Command = require('../Command')

_messages = []

class ChatController
  constructor: (socket) ->
    @socket = socket

  onMessage: (data) =>
    return if !@socket
    if !Command.parse(@socket, data.message)
      _messages.push({
        user: User.getUser(@socket.id)
        message: data.message
      })

      if _messages.length > 50
        _messages.shift()

    @socket.emit 'chat:refresh', _messages
    @socket.broadcast.emit 'chat:refresh', _messages

  onRefresh: (data) =>
    return if !@socket
    @socket.emit 'chat:refresh', _messages

  bind: ->
    @socket.on 'chat:message', @onMessage
    @socket.on 'chat:refresh', @onRefresh

module.exports = ChatController
