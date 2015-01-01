###
# Room Store
###

AppDispatcher = require('../AppDispatcher')
EventEmitter = require('events').EventEmitter
RoomConstants = require('../constants/RoomConstants')

assign = require('react/lib/Object.assign')

CHANGE_EVENT = 'change'

socket = io('/game')
socket.emit 'room:refresh'

_rooms = []

socket.on 'room:refresh', (data) ->
  _rooms = data
  RoomStore.emitChange()

socket.on 'room:created', (data) ->
  if data.error
    console.log data
  else
    # TODO: move in room

create = (roomInfo) ->
  socket.emit 'room:create', roomInfo

dispatcher = (payload) ->
  action = payload.action
  roomInfo = {}

  switch action.actionType
    when RoomConstants.ROOM_CREATE
      roomInfo = action.roomInfo
      if roomInfo.name
        create(roomInfo)

  return true

RoomStore = assign {}, EventEmitter.prototype, {
  getAll: ->
    _rooms

  emitChange: ->
    @emit CHANGE_EVENT

  addChangeListener: (callback) ->
    @on CHANGE_EVENT, callback

  removeChangeListeher: (callback) ->
    @removeListener CHANGE_EVENT, callback

  dispatcherIndex: AppDispatcher.register( dispatcher )
}

module.exports = RoomStore
