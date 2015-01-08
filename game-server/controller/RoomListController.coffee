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
    if @isFreeUser(user)
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

  onJoin: (roomID) =>
    user = User.getUser(@socket.id)
    if @isFreeUser(user)
      @socket.emit 'room:join', { room: roomID }
      if Room.getRoom(roomID)
        Room.getRoom(roomID).join(user)
        @socket.emit 'room:refresh', Room.getAllRoom()
        @socket.broadcast.emit 'room:refresh', Room.getAllRoom()
      else
        @socket.emit 'room:join', { error: 'Room not found' }
    else
      @socket.emit 'room:join', { error: 'Already joined a room' }

  onLeave: (roomID) =>
    user = User.getUser(@socket.id)
    Room.getRoom(roomID).leave(user) if Room.getRoom(roomID)

  isFreeUser: (user) =>
    (user and user.currentRoomId is null)

  bind: ->
    @socket.on 'room:refresh', @onRefresh
    @socket.on 'room:create', @onCreate
    @socket.on 'room:join', @onJoin
    @socket.on 'room:leave', @onLeave


module.exports = RoomListController
