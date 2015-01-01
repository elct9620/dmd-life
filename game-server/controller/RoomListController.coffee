###
# Room List Controller
###

Room = require('../model/Room')
User = require('../model/User')

class RoomListController
  socket: null
  constructor: (socket) ->
    @socket = socket

  onRefresh: (data) =>
    @socket.emit 'room:refresh', Room.getAllRoom()

  onCreate: (data) =>
    user = User.getUser(@socket.id)
    if user and user.currentRoomId is null
      room = new Room(data.name, user)
      room.on Room.EVENTS.PLAYER_LEAVE, @onPlayerLeave

      @socket.emit 'room:created', room
      @socket.emit 'room:refresh', Room.getAllRoom()
      @socket.broadcast.emit 'room:refresh', Room.getAllRoom()
    else
      @socket.emit 'room:created', {error: 'Already joined a room'}

  onPlayerLeave: (room) =>
    if room.players.length <= 0
      room.destroy()

    @socket.broadcast.emit 'room:refresh', Room.getAllRoom()

  bind: ->
    @socket.on 'room:refresh', @onRefresh
    @socket.on 'room:create', @onCreate


module.exports = RoomListController
