###
# User Model
#
# Handle users on server
###

EventEmitter = require('events').EventEmitter
Command = require('../Command')

_onlineUsers = {}

# Register Commands
Command.register '/nick', (socket, newNickname) ->
  if _onlineUsers.hasOwnProperty(socket.id)
    _onlineUsers[socket.id].setNickname(newNickname)
  return true

# User Class

class User extends EventEmitter
  # Private Member
  socket = null

  # Public Member
  nickname: "訪客"
  currentRoomId: null

  # Events
  @EVENTS: {
    'OFFLINE': 'OFFLINE'
  }

  constructor: (initSocket) ->
    super
    if _onlineUsers.hasOwnProperty(initSocket.id)
      return _onlineUsers[initSocket.id]

    socket = initSocket
    _onlineUsers[socket.id] = @

    @currentRoomId = null

  setNickname: (nickname) ->
    @nickname = nickname

  joinRoom: (room) ->
    console.log room
    @currentRoomId = room.id
    socket.emit 'room:joined', @currentRoomId

  leaveRoom: ->
    @currentRoomId = null
    socket.emit 'room:leave', @currentRoomId

  destroy: ->
    @emit User.EVENTS.OFFLINE
    delete _onlineUsers[socket.id]

  @getUser: (socketId) ->
    _onlineUsers[socketId]

  @getUsers: ->
    users = []
    for key, user of _onlineUsers
      users.push(user.nickname)
    users


module.exports = User
