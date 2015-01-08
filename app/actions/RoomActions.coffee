###
# Room Action
###

AppDispatcher = require('../AppDispatcher')
RoomConstants = require('../constants/RoomConstants')

Router = require('../router')

socket = io('/game')

socket.on 'room:join', (data) ->
  if data and data['error']
    console.log "Join Room Failed: ", data['error']
  else
    Router.transitionTo("/Room/#{data.room}")

RoomActions = {
  create: (roomInfo) ->
    AppDispatcher.handleViewAction {
      actionType: RoomConstants.ROOM_CREATE
      roomInfo: roomInfo
    }

  join: (roomID) ->
    socket.emit 'room:join', roomID
}

module.exports = RoomActions
