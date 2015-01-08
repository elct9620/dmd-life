###
# Game Server
#
# A socket.io realtime server to hosting player to play in realtime
###

socketIO = require('socket.io')

# Helper
Command = require('./Command')

# Models
User = require('./model/User')

# Controller
ChatController = require('./controller/ChatController')
RoomListController = require('./controller/RoomListController')

_messages = []

GameServer = (http) ->
  io = socketIO(http)
  game = io.of('/game')

  game.on 'connection', (socket) ->

    user = new User(socket)
    user.setNickname("訪客" + (new Date()).getTime().toString().substr(-3, 3))

    # Setup Realtime Controller
    (new ChatController(socket)).bind()
    (new RoomListController(socket)).bind()


    # Handle Disconnect Event
    socket.on 'disconnect', ->
      # Clear user on disconnect
      User.getUser(socket.id).destroy() if User.getUser(socket.id)
      socket.broadcast.emit('channel', {users: User.getUsers()})


module.exports = GameServer
