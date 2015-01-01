###
# Game Room Model
###

EventEmitter = require('events').EventEmitter

_rooms = {}

insertRoom = (room) ->
  roomID = (new Date()).getTime()
  if _rooms.hasOwnProperty(roomID)
    return insertRoom(room)

  _rooms[roomID] = room
  return roomID

class Room extends EventEmitter
  id: null
  name: "遊戲房間"
  host: null
  players: []
  maxPlayer: 4
  isPlaying: false

  @STATUS: {
    GAME_START: 'GAME_START'
    GAME_END: 'GAME_END'
  }

  @EVENTS: {
    PLAYER_JOIN: 'PLAYER_JOIN'
    PLAYER_LEAVE: 'PLAYER_LEAVE'
  }

  constructor: (name, host) ->
    super
    @id = insertRoom(@)

    @name = name
    @host = host
    @players = []
    @maxPlayer = 4
    @isPlaying = false

    @join(host)

  join: (player) ->
    if @players.length < @maxPlayer
      player.joinRoom(@)
      @players.push(player)
      @emit(Room.EVENTS.PLAYER_JOIN)
      return true
    return false

  leave: (player) ->
    for joinedPlayer, key in @players
      if joinedPlayer.id is player.id
        @players.splice(key, 1)
        player.leaveRoom()
        @emit(Room.EVENT.PLAYER_LEAVE)
        return true
    return false

  start: ->
    @isPlaying = true
    @emit(Room.STATUS.GAME_START)

  destroy: ->
    if _rooms.hasOwnProperty(@id)
      delete _rooms[@id]
      @emit(Room.STATUE.GAME_END)
      return true

    return false

  @getAllRoom: ->
    _rooms

module.exports = Room
