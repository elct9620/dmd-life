###
# User Model
#
# Handle users on server
###

Command = require('../Command')

_onlineUsers = {}

# Register Commands
Command.register '/nick', (socket, newNickname) ->
  if _onlineUsers.hasOwnProperty(socket.id)
    _onlineUsers[socket.id].setNickname(newNickname)
  return true

# User Class

class User
  # Private Member
  socket = null

  # Public Member
  nickname: "訪客"

  constructor: (initSocket) ->
    if _onlineUsers.hasOwnProperty(initSocket.id)
      return _onlineUsers[initSocket.id]

    socket = initSocket
    _onlineUsers[socket.id] = @

  setNickname: (nickname) ->
    @nickname = nickname

  destroy: ->
    delete _onlineUsers[socket.id]

  @getUser: (socketId) ->
    _onlineUsers[socketId]

  @getUsers: ->
    users = []
    for key, user of _onlineUsers
      users.push(user.nickname)
    users


module.exports = User
